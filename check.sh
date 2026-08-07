#!/usr/bin/env bash
# ============================================================================
# Accountable Mail Association - content policy check
# Run from the repo root:  ./scripts/check.sh
# Exits non-zero on any violation, so it can gate a commit or a CI build.
# ============================================================================
set -uo pipefail
cd "$(dirname "$0")/.."

FAIL=0
red()  { printf "\033[31m%s\033[0m\n" "$1"; }
grn()  { printf "\033[32m%s\033[0m\n" "$1"; }
head_() { printf "\n\033[1m%s\033[0m\n" "$1"; }

PAGES=$(ls *.html 2>/dev/null | grep -v '^_template')

# ---------------------------------------------------------------------------
head_ "1. Forbidden terms (vendor neutrality)"
# Add any new company, product, partner, or customer name to this list.
FORBIDDEN=(
  "Easy Send" "EasySend" "Digitalized" "Krengeltech" "Krengel"
  "GrayHair" "Gray Hair" "ConnectSuite" "Connect Suite"
  "BlueCrest" "Quadient" "Solimar" "Pitney" "Neopost" "Bell and Howell"
  "SimpleCertifiedMail" "Certified Mail Envelopes" "Walz"
  "Fiserv" "State Farm" "Nordis" "Docufree" "Mortgage Connect" "CMSI"
  # Note: federalregister.gov, govinfo.gov, and prc.gov are permitted sources.
  # They are primary government documents, same standing as USPS publications.
)
for term in "${FORBIDDEN[@]}"; do
  if grep -ril "$term" --include='*.html' --include='*.css' --include='*.md' . >/dev/null 2>&1; then
    red "  FORBIDDEN TERM: '$term' found in:"
    grep -ril "$term" --include='*.html' --include='*.css' . | grep -v CONTENT-POLICY | grep -v 'scripts/' | sed 's/^/    /'
    FAIL=1
  fi
done
[ $FAIL -eq 0 ] && grn "  clean"

# ---------------------------------------------------------------------------
head_ "2. Non-USPS outbound links"
# accountablemail.org is our own canonical and Open Graph URL, not an outbound link.
BADLINKS=$(grep -oh 'href="https\?://[^"]*"' $PAGES 2>/dev/null \
  | sed 's/href="//; s/"$//' \
  | grep -v 'accountablemail.org' \
  | grep -v 'usps.com' \
  | grep -v 'usps.gov' \
  | grep -v 'federalregister.gov' \
  | grep -v 'govinfo.gov' \
  | grep -v 'fonts.googleapis.com' \
  | grep -v 'fonts.gstatic.com' \
  | grep -v 'linkedin.com' \
  | grep -v 'prc.gov' \
  | sort -u)
if [ -n "$BADLINKS" ]; then
  red "  Review these outbound links. Only USPS, fonts, and LinkedIn are expected:"
  echo "$BADLINKS" | sed 's/^/    /'
  FAIL=1
else
  grn "  clean"
fi

# ---------------------------------------------------------------------------
head_ "3. Em dashes"
if grep -l '—' *.html assets/*.css 2>/dev/null | grep -q .; then
  red "  Em dashes found in:"
  grep -l '—' *.html assets/*.css 2>/dev/null | sed 's/^/    /'
  FAIL=1
else
  grn "  clean"
fi

# ---------------------------------------------------------------------------
head_ "4. Broken internal links"
python3 - <<'PY'
import re, os, glob, sys
files = {os.path.basename(p) for p in glob.glob('*.html')}
bad = []
for p in glob.glob('*.html'):
    if os.path.basename(p).startswith('_template'):
        continue
    for href in re.findall(r'href="([^"]+)"', open(p).read()):
        if href.startswith(('http', 'mailto:', '#')):
            continue
        target = href.split('#')[0]
        if not target:
            continue
        if target.startswith('assets/'):
            if not os.path.exists(target):
                bad.append((p, href))
        elif target not in files:
            bad.append((p, href))
for p, h in bad:
    print(f"    {p} -> {h}")
sys.exit(1 if bad else 0)
PY
if [ $? -ne 0 ]; then red "  broken links above"; FAIL=1; else grn "  clean"; fi

# ---------------------------------------------------------------------------
head_ "5. Topic pages missing a sources block"
MISSING=""
for f in $PAGES; do
  case "$f" in
    index.html|topics.html|about.html|community.html|glossary.html|news.html) continue ;;
  esac
  grep -q 'class="sources"' "$f" || MISSING="$MISSING $f"
done
if [ -n "$MISSING" ]; then
  red "  Missing sources block:"; for f in $MISSING; do echo "    $f"; done; FAIL=1
else
  grn "  clean"
fi

# ---------------------------------------------------------------------------
head_ "6. Pages missing a review date"
MISSING=""
for f in $PAGES; do
  case "$f" in
    index.html|about.html|community.html) continue ;;
  esac
  grep -q 'Reviewed\|Updated' "$f" || MISSING="$MISSING $f"
done
if [ -n "$MISSING" ]; then
  red "  Missing review date:"; for f in $MISSING; do echo "    $f"; done; FAIL=1
else
  grn "  clean"
fi

# ---------------------------------------------------------------------------
head_ "7. Unreplaced template placeholders"
PH=$(grep -l 'PAGE TITLE\|SOURCE-URL\|RELATED-PAGE\|PARENT-PILLAR\|PAGE-FILENAME' $PAGES 2>/dev/null)
if [ -n "$PH" ]; then
  red "  Placeholder text still present in:"; echo "$PH" | sed 's/^/    /'; FAIL=1
else
  grn "  clean"
fi

# ---------------------------------------------------------------------------
head_ "8. Form-name accuracy (see FORM-NAMES.md)"
FORMFAIL=0
# 3817 and 3800 are paper only. Flag any claim of an electronic version.
for f in $PAGES; do
  if grep -Eiq 'electronic (ps )?form 3817|electronic (ps )?form 3800|3817 (may be|can be) submitted electronic|3800 (may be|can be) submitted electronic' "$f"; then
    red "  $f claims an electronic PS Form 3817 or 3800. Both are paper only."; FORMFAIL=1
  fi
done
# Mail.XML must never appear on a Certificate of Mailing page as a submission path.
for f in $PAGES; do
  case "$f" in
    *com*|*certificate-of-mailing*)
      if grep -q 'Mail\.XML' "$f" && ! grep -q 'not.*a submission path\|is not an option\|not a COM path\|not a Certificate of Mailing path' "$f"; then
        red "  $f mentions Mail.XML on a COM page without the exclusion note."; FORMFAIL=1
      fi ;;
  esac
done
# PS Form 3877 should carry its full official title at least once per page that names it.
for f in $PAGES; do
  if grep -q '3877' "$f" && ! grep -q 'Firm Mailing Book for Accountable Mail' "$f"; then
    red "  $f names PS Form 3877 without the official title."; FORMFAIL=1
  fi
done
# Stale count language. The forms table and submission paths have both changed size before.
for f in $PAGES; do
  if grep -qi 'three forms\|three very different\|which of the three' "$f"; then
    red "  $f uses a stale form count. Check it against the actual table."; FORMFAIL=1
  fi
  if grep -qi 'three submission paths\|three submission channels' "$f"; then
    red "  $f says three submission paths. Automated COM uses two."; FORMFAIL=1
  fi
  # The COM pillar must give PS Form 3877 narrative treatment, not just a table row.
  if [ "$f" = "certificate-of-mailing.html" ] && ! grep -q '<h3>PS Form 3877' "$f"; then
    red "  $f has no PS Form 3877 section. A table row is not coverage."; FORMFAIL=1
  fi
  # Any page listing the COM forms should include PS Form 3877, which is the one
  # most often left out because it is not technically a Certificate of Mailing form.
  if grep -q '3606-D' "$f" && grep -q '3665' "$f" && ! grep -q '3877' "$f"; then
    red "  $f lists the COM forms but omits PS Form 3877."; FORMFAIL=1
  fi
done
# PS Form 3665 should carry its official title at least once per page that names it.
for f in $PAGES; do
  if grep -q '3665' "$f" && ! grep -qi 'Certificate of Mailing &mdash; Firm\|Certificate of Mailing . Firm' "$f"; then
    red "  $f names PS Form 3665 without the official title."; FORMFAIL=1
  fi
done
[ $FORMFAIL -eq 0 ] && grn "  clean" || FAIL=1

# ---------------------------------------------------------------------------
head_ "9. Nav and footer consistency"
# The nav and footer are duplicated in every file, so a menu change means editing
# all of them. This compares every page against index.html and fails on drift.
# _template-topic.html is checked too: if the template goes stale, every new page
# inherits the problem.
CHROMEFAIL=0
REF="index.html"

navblock()  { sed -n '/<nav class="main"/,/<\/nav>/p' "$1" | sed 's/ aria-current="page"//'; }
footblock() { sed -n '/<footer class="site">/,/<\/footer>/p' "$1"; }
sig() { tr -d ' \t\n\r' | md5sum | cut -d' ' -f1; }

if [ ! -f "$REF" ]; then
  red "  Reference page $REF not found. Cannot run this check."
  CHROMEFAIL=1
else
  REFNAV=$(navblock "$REF" | sig)
  REFFOOT=$(footblock "$REF" | sig)
  # Guard against an empty reference, which would make every page "match".
  if [ -z "$(navblock "$REF")" ] || [ -z "$(footblock "$REF")" ]; then
    red "  $REF has no nav or no footer block. Fix the reference first."
    CHROMEFAIL=1
  else
    for f in $PAGES _template-topic.html; do
      [ -f "$f" ] || continue
      [ "$f" = "$REF" ] && continue
      if [ -z "$(navblock "$f")" ]; then
        red "  $f has no nav block."; CHROMEFAIL=1
      elif [ "$(navblock "$f" | sig)" != "$REFNAV" ]; then
        red "  $f nav differs from $REF:"
        diff <(navblock "$REF") <(navblock "$f") | sed 's/^/      /' | head -14
        CHROMEFAIL=1
      fi
      if [ -z "$(footblock "$f")" ]; then
        red "  $f has no footer block."; CHROMEFAIL=1
      elif [ "$(footblock "$f" | sig)" != "$REFFOOT" ]; then
        red "  $f footer differs from $REF:"
        diff <(footblock "$REF") <(footblock "$f") | sed 's/^/      /' | head -14
        CHROMEFAIL=1
      fi
    done
  fi
fi
[ $CHROMEFAIL -eq 0 ] && grn "  clean" || FAIL=1

# ---------------------------------------------------------------------------
head_ "10. Share tags (canonical and Open Graph)"
# LinkedIn builds its preview card from these. A page missing them renders as a
# bare link, and a page with the wrong og:url points the card at another page.
SHAREFAIL=0
SITE="https://accountablemail.org"
for f in $PAGES _template-topic.html; do
  [ -f "$f" ] || continue
  for tag in 'rel="canonical"' 'og:title' 'og:description' 'og:image' 'og:url' 'twitter:card'; do
    grep -q "$tag" "$f" || { red "  $f is missing $tag"; SHAREFAIL=1; }
  done
  # The template carries placeholder URLs on purpose; check 7 catches those if
  # they survive into a real page. Skip the URL match for it only.
  [ "$f" = "_template-topic.html" ] && continue
  # og:url and canonical must point at this page, not a copied one.
  if [ "$f" = "index.html" ]; then WANT="$SITE/"; else WANT="$SITE/$f"; fi
  grep -q "<link rel=\"canonical\" href=\"$WANT\">" "$f" \
    || { red "  $f canonical should be $WANT"; SHAREFAIL=1; }
  grep -q "<meta property=\"og:url\" content=\"$WANT\">" "$f" \
    || { red "  $f og:url should be $WANT"; SHAREFAIL=1; }
  # An empty description produces a blank card.
  grep -q '<meta property="og:description" content="">' "$f" \
    && { red "  $f has an empty og:description"; SHAREFAIL=1; }
done
[ -f assets/share.png ] || { red "  assets/share.png is missing; every card will render without an image."; SHAREFAIL=1; }
[ $SHAREFAIL -eq 0 ] && grn "  clean" || FAIL=1

echo
if [ $FAIL -eq 0 ]; then
  grn "PASS. Safe to commit."
else
  red "FAIL. Fix the items above before committing."
fi
exit $FAIL
