# LinkedIn Page kit

Everything needed to stand up the association's LinkedIn presence, plus an honest account of what
LinkedIn will and will not let you automate.

---

## Part 1: What is actually possible

Read this before planning anything, because two of the three things you asked for work differently
than people expect.

| What you want | Reality |
| --- | --- |
| **Promote the site** | Fully possible. This is what a LinkedIn Page is for. |
| **Capture posts and comments** | Partly possible, and not automatically. See below. |
| **Enrollment and setup for new users** | Possible, but it happens on your site, not on LinkedIn. LinkedIn sends people there. |

### On capturing posts and comments

There is no supported way to pull a live feed of your LinkedIn posts and their comments onto your own
website. LinkedIn's Community Management API, which exposes comment data programmatically, requires
approval into a restricted partner program and is aimed at social media management platforms, not
individual pages. Assume you will not get access.

What does work:

1. **Individual post embeds.** Any public LinkedIn post has an "Embed this post" option under the
   three-dot menu. It gives you an iframe that renders the post and links through to the live
   comments. This is manual, one post at a time, and it is the right tool for showcasing three or
   four good threads. `community.html` has a marked slot for these.
2. **Manual curation.** Read your own comments, pick the ones that raised a general problem, and turn
   them into knowledge center pages. This is slower than an API and produces far better material,
   because a human decided each item was worth keeping.
3. **LinkedIn's own analytics.** The Page admin view gives you impressions, engagement, follower
   demographics, and per-post performance. Export it monthly. That is your feedback loop on which
   topics to write next.

The workflow that actually works is a loop, and it is deliberately manual:

```
LinkedIn post  ->  comments arrive  ->  you spot a general question
      ^                                          |
      |                                          v
   link back  <-  publish page on site  <-  research against USPS docs
```

### On lead capture

LinkedIn Lead Gen Forms exist, but they are a paid ad product. For an association that has not
launched yet, the free path is better: a custom button on the Page pointing at
`community.html#enroll`, and a link in every post. You own the list, and there is no ad spend.

---

## Part 2: Page setup, field by field

Create at **linkedin.com/company/setup/new** and choose **Company**. Everything below is
copy-paste ready. Replace the name if the board settles on a different one.

### Identity

**Name**
```
Accountable Mail Association
```

**LinkedIn public URL**
```
linkedin.com/company/accountable-mail-association
```

**Website**
```
https://accountablemail.org
```

**Industry**
```
Non-profit Organizations
```
Secondary consideration: "Civic and Social Organizations" also fits. Avoid anything with "Software"
or "Technology" in it, for the reasons in CONTENT-POLICY.md.

**Company size**
```
2-10 employees
```

**Company type**
```
Nonprofit
```

**Tagline** (120 character limit)
```
A reference library and industry voice for organizations that mail with proof.
```

### About section

```
The Accountable Mail Association represents organizations that mail with proof: Certified Mail,
Certificate of Mailing, Return Receipt, and the evidence that regulators, courts, and auditors
expect those services to produce.

Accountable mail is the quiet exception in a shrinking industry. While most mail classes decline,
organizations keep sending Certified Mail and Certificates of Mailing because a statute, a contract,
a regulator, or a judge requires it. That demand is not discretionary. Yet the services still carry
decades of manual process, acceptance practice varies between facilities, and the mailers who depend
on them most rarely sit at the table where the rules get written.

We do three things about that.

We publish. Our knowledge center is a free, open reference covering Certificate of Mailing forms and
automation, Certified Mail and Return Receipt, account structure and tracking data access, retention,
and compliance. Every page cites the USPS documentation it draws from and carries a review date.

We represent. We carry member issues into the Mailers' Technical Advisory Committee and into direct
engagement with USPS, and we report back to members after every quarterly meeting.

We convene. Mailers, government agencies, and print and mail service providers face the same problems
in isolation. We bring them together.

The association is independent and vendor neutral. We do not endorse, certify, or recommend
commercial products, and no supplier controls our agenda or our positions.

Free knowledge center: accountablemail.org
Enroll for change notices: accountablemail.org/community.html
```

### Specialties

Add these, up to twenty. They drive LinkedIn search:

```
Certified Mail
Certificate of Mailing
Automated Certificate of Mailing
Proof of Mailing
Return Receipt
Accountable Mail
Mail Compliance
Regulatory Notice
Legal Notice Mailing
USPS Extra Services
Business Mail Entry
Electronic Documentation
Mail Tracking Data
Records Retention
Postal Advocacy
```

### Custom button

```
Button text:  Sign Up
Destination:  https://accountablemail.org/community.html#enroll
```

This is the single most important setting on the page and most organizations leave it at the default.
It puts a persistent enrollment call to action at the top of your Page.

### Visual assets

| Asset | Size | What to use |
| --- | --- | --- |
| Logo | 300 x 300 px | The round-date stamp mark from the site, on white |
| Cover image | 1128 x 191 px | Deep navy (#0E1F2E) with the stamp at left and the tagline set in white |
| Post images | 1200 x 627 px | Same palette. Consistency matters more than variety. |

The stamp SVG is inline in `index.html`. Export it to PNG at the sizes above.

---

## Part 3: Launch sequence

Do not post into an empty page. Fill it first, then invite.

**Before you invite anyone**
1. Complete every field above. LinkedIn measures profile completeness and throttles reach on thin pages.
2. Publish three posts, spaced across a few days, so an arriving visitor sees an active page.
3. Add the Page to your personal profile under Experience, so your network sees the affiliation.

**First three posts**

*Post 1, the founding statement*
> Every class of mail is shrinking except the one nobody represents.
>
> Organizations do not send Certified Mail because they want to. They send it because a statute, a
> contract, a regulator, or a judge requires proof. That demand holds steady while everything around
> it declines.
>
> And yet: green cards. Firm mailing books. Round stamped paper in a filing cabinet. Acceptance
> practice that changes when you cross a district line.
>
> So we started an association for it. The Accountable Mail Association represents organizations that
> mail with proof, and the first thing we built is a free reference library covering Certified Mail
> and Certificate of Mailing end to end.
>
> No login, no vendor pitch, every page cited against USPS documentation.
>
> [link to accountablemail.org]
>
> If accountable mail is part of your job, follow the page. And tell me what this library should
> cover next.

*Post 2, the useful one*
> A Certificate of Mailing question that comes up constantly: does automating it get rid of the trip
> to the BMEU?
>
> No. And that misconception costs people implementations.
>
> What automation actually removes: printing and hauling stacks of firm sheets, waiting on a clerk to
> round stamp each one by hand, carrying stamped paper back, then scanning and indexing it so someone
> can find it eighteen months later.
>
> What it does not remove: presenting the mail. Certificate of Mailing may be presented only at the
> time of mailing.
>
> For a high volume operation the paper handling is the majority of the labor. The trip is the
> smallest part.
>
> Full explainer, including which forms have an electronic path and which do not:
> [link to automated-com.html]

*Post 3, the one that starts arguments in the good way*
> PS Form 3606-D is the cheapest Certificate of Mailing you can buy, and for most compliance use
> cases it is the wrong answer.
>
> It certifies a count of identical weight pieces. It does not provide evidence that any piece went
> to any particular address, and it cannot be used as a certificate for individual pieces or
> itemized lists.
>
> If your obligation is to show that a named person was notified on a specific date, a 3606-D will
> not do it. You want PS Form 3665.
>
> The part that worries me: this is the kind of thing nobody discovers until it is challenged.
>
> [link to certificate-of-mailing.html]
>
> Has anyone here had a 3606-D actually tested in a dispute? I would like to hear how it went.

**Then invite**
- Use the Page's "Invite connections" tool. There is a monthly credit limit, so spend it on people
  who genuinely touch accountable mail rather than your whole network.
- Post the launch from your personal profile too, and comment on your own post with the link.
  Personal profiles reach much further than new Pages.
- Ask five colleagues to follow and comment on day one. Early engagement decides how far a Page's
  posts travel.

---

## Part 4: Posting rhythm

Two posts a week is sustainable and enough. A workable rotation:

| Cadence | Type | Purpose |
| --- | --- | --- |
| Weekly | One knowledge center page, with the key insight written out in the post | Traffic and authority |
| Weekly | One observation, question, or change notice | Comments and reach |
| Quarterly | MTAC readout, public version | Proves the representation claim |
| As it happens | Price changes, DMM revisions, deadlines | Makes the page worth following |

Rules that matter more than frequency:

- **Put the value in the post, not behind the link.** LinkedIn suppresses posts that exist only to
  push people off the platform. Write the insight out, then link for the full version.
- **End with a real question.** Comments are the engine, and generic prompts get generic replies.
- **Reply to every comment within a few hours.** This is the whole strategy. A page that answers is
  worth following.
- **Never mention a product.** Yours or anyone's. See CONTENT-POLICY.md.
- **Post Tuesday through Thursday morning, US Eastern.** This audience is at work.

---

## Part 5: Monthly maintenance

- Export Page analytics. Note which topics drew comments, not just impressions.
- Turn the best two comment threads into knowledge center pages.
- Embed any thread worth preserving into `community.html`.
- Update the curated "From the threads" entries on `community.html`.
- Spend the invite credits.
