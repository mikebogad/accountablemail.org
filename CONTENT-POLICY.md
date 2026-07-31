# Content policy

This is a trade association website. It has to read as one, to members, to USPS, and to the other
MTAC member associations. Everything below is a hard rule, not a preference.

## 1. Vendor neutrality

**No commercial product, platform, or software company may be named anywhere on this site.** No
exceptions for the founder's employer, for members, for sponsors, or for partners.

The only permitted exception: a product name that appears because USPS documentation names it as
part of the postal infrastructure. Examples of permitted names, all USPS systems: PostalOne!,
Mail.dat, Mail.XML, Postal Wizard, Business Customer Gateway, Enterprise Payment System, Informed
Visibility, Informed Delivery.

Specifically forbidden, and checked automatically by `scripts/check.sh`:

- Any reference to the founder's employer or its products
- Any Certified Mail or Certificate of Mailing software vendor, including competitors
- Any print, mail, or postal equipment manufacturer
- Any partner or channel relationship, named or implied
- Any customer or prospect of any member

If a page needs to describe a category of tool, describe the category: "mail preparation software,"
"a Certified Mail platform," "your systems of record." Never the brand.

**Why this rule is absolute.** The founder works for a supplier in this market. That fact is public
and fine. What is not fine is an association site that reads like a content-marketing funnel, because
that is the first thing a skeptical MTAC association executive will look for, and finding it would
cost more credibility than any amount of traffic is worth.

## 2. Sourcing

Every factual claim about postal regulation, pricing, forms, or systems must trace to a USPS source.

- Every topic page carries a `<div class="sources">` block at the end, listing the specific USPS
  document with a working link and a note on what it supports.
- Prefer PostalPro, Postal Explorer, usps.com, and USPS FAQ over any third party.
- Never cite a vendor blog as a source, even when it is correct.
- If a fact cannot be verified in a USPS document, either leave it out or mark it clearly as
  approximate and subject to change.
- Prices go stale. Always state the effective date and link Notice 123.

## 3. Review dates

Every topic page shows a "Reviewed MONTH YEAR" line in the byline. Re-verify pages on this schedule:

| Trigger | Action |
| --- | --- |
| Any USPS price change | Re-check every page with a fee in it, same week |
| DMM revision affecting 503 | Re-check both pillar pages and automated COM |
| Quarterly | Spot-check the four oldest pages |
| Annually | Full pass on everything |

## 4. Tone and house style

- No em dashes. Commas for parenthetical asides, semicolons for transitional breaks, colons for
  labels.
- Oxford commas, always.
- "Such as," not "like."
- Hyphenate compound adjectives.
- "The State of [X]" when naming a state government.
- Active voice.
- No brochure language. No "leverage," "solution," "empower," "seamless," or "best-in-class."
- Write for a mail operations supervisor, not for a search engine.

## 5. What the site does not do

- Does not sell or share contact information
- Does not accept paid placement in the knowledge center
- Does not endorse, certify, or recommend commercial products
- Does not publish member volumes, pricing, or operational details without written permission

## Before every commit

Run `./scripts/check.sh`. It fails the build on forbidden terms, em dashes, broken internal links,
and topic pages missing a sources block.
