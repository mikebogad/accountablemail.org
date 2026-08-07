# Accountable Mail Association

A static reference site for Certified Mail and Certificate of Mailing. No build step, no
dependencies, no framework. Plain HTML and one stylesheet.

**New to GitHub? Read [GETTING-ONLINE.md](GETTING-ONLINE.md) first.** No command line required.

**Read [CONTENT-POLICY.md](CONTENT-POLICY.md) before editing anything.** The vendor neutrality rule
is the reason this site works.

---

## Files

```
.
├── index.html                 Home, hub entry point
├── topics.html                Knowledge center index, all topics and their status
├── certified-mail.html        Pillar guide
├── certificate-of-mailing.html Pillar guide
├── automated-com.html         Flagship explainer
├── return-receipt.html        Topic page
├── mailer-id-crid.html        Topic page
├── glossary.html              39-term reference
├── community.html             LinkedIn hub and free enrollment
├── about.html                 Mission, MTAC, membership, board, join
├── _template-topic.html       Copy this to add a page
├── CNAME                      Custom domain for GitHub Pages
├── assets/
│   ├── site.css               All styling, shared by every page
│   └── share.png              1200x630 Open Graph card for LinkedIn previews
├── scripts/
│   └── check.sh               Content policy check, run before every commit
├── GETTING-ONLINE.md          START HERE if you do not use the command line
├── CONTENT-POLICY.md          Editorial rules, non-negotiable
└── LINKEDIN-PAGE-KIT.md       LinkedIn Page setup and posting playbook
```

---

## Getting it online

**If you are not comfortable with the command line, read
[GETTING-ONLINE.md](GETTING-ONLINE.md) instead of this section.** It walks through the whole thing in
a web browser, with no software to install. This section assumes you already use git.

```bash
cd accountable-mail-site
git init && git branch -M main
git add . && git commit -m "Initial site"
git remote add origin https://github.com/YOURNAME/YOURREPO.git
git push -u origin main
```

Then Settings, Pages, deploy from `main` at root. Custom domain requires a `CNAME` file plus four A
records and a CNAME record; the details are in GETTING-ONLINE.md, Step 8.

Netlify and Cloudflare Pages both connect directly to the repo and deploy on every push, with no
build command and the publish directory set to the repo root. Either is easier than GitHub Pages for
DNS and HTTPS.

---

## Adding a page

```bash
cp _template-topic.html restricted-delivery.html
# edit it, replacing every ALL-CAPS placeholder
```

Then:

1. Update the card in `topics.html`, adding the `href` and a `pill live` "Published" badge.
1b. Replace `PAGE-FILENAME.html` in the `canonical` and `og:url` tags with the real filename, and
   update `og:title` and `og:description`. Check 7 fails on the placeholder and check 10 fails on a
   wrong URL, so neither can ship by accident.
2. Add it to the footer list in every page, or run a find and replace across the repo. Check 9
   compares every nav and footer against `index.html`, so a page you miss will fail the build
   rather than drift quietly.
3. Run the check.
4. Commit.

```bash
bash scripts/check.sh
git add .
git commit -m "Add Restricted Delivery topic page"
git push
```

---

## The content check

`scripts/check.sh` enforces ten things and exits non-zero on any failure:

1. No forbidden vendor, partner, or customer names
2. No outbound links except USPS, Google Fonts, and LinkedIn
3. No em dashes
4. No broken internal links
5. Every topic page has a sources block
6. Every topic page has a review date
7. No unreplaced template placeholders
8. Form-name accuracy against FORM-NAMES.md
9. Nav and footer identical to `index.html` on every page, including the template
10. Canonical, Open Graph, and Twitter card tags present and pointing at the right page

Run it before every commit:

```bash
bash scripts/check.sh
```

### Make it automatic

As a git pre-commit hook, so you cannot forget:

```bash
cat > .git/hooks/pre-commit <<'EOF'
#!/usr/bin/env bash
bash scripts/check.sh || {
  echo "Content policy check failed. Commit aborted."
  exit 1
}
EOF
chmod +x .git/hooks/pre-commit
```

As a GitHub Action, so it runs on every push and pull request:

```bash
mkdir -p .github/workflows
cat > .github/workflows/content-check.yml <<'EOF'
name: Content policy check
on: [push, pull_request]
jobs:
  check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run content policy check
        run: bash scripts/check.sh
EOF
```

Commit both. The Action puts a green check or a red X on every commit in the GitHub UI, which is the
simplest form of monitoring available.

---

## Maintenance schedule

| Trigger | Action |
| --- | --- |
| USPS price change | Re-verify every page containing a fee, same week. Currently `return-receipt.html` and `certificate-of-mailing.html`. |
| DMM 503 revision | Re-verify both pillar pages and `automated-com.html`. |
| Quarterly, after MTAC | Publish the public readout, update `community.html`. |
| Monthly | Curate LinkedIn threads into `community.html`. |
| Annually | Full review pass, update every "Reviewed" date. |

---

## Notes

- Fonts load from Google Fonts. If you would rather not depend on a third party, download Bitter,
  Source Sans 3, and IBM Plex Mono into `assets/fonts/` and swap the `@font-face` declarations. The
  fallback stack is already Arial, so nothing breaks if the CDN is unreachable.
- The two forms, enrollment on `community.html` and membership on `about.html`, do not submit
  anywhere. Point their `action` attributes at your email platform or form handler before launch.
- The LinkedIn URL in `community.html` is a placeholder. Update it once the Page exists.
