# Getting the site online

No command line. No software to install. Everything below happens in a web browser.

Set aside twenty minutes. Steps 1 through 4 get your site live on the internet.

---

## Before you start: the one mistake everybody makes

When you upload to GitHub, you must upload **the files inside the folder**, not the folder itself.

**Right.** GitHub shows this at the top level of your repository:
```
index.html
about.html
topics.html
assets/
...
```

**Wrong.** GitHub shows this:
```
accountable-mail-site/
```

If you get the wrong one, your site shows a "404 File not found" page and nothing else. It is the
single most common problem, it is easy to fix, and Step 5 tells you how to check.

---

## Step 1. Get the files onto your computer

1. Download `accountable-mail-site.zip` from the chat.
2. Find it in your Downloads folder.
3. Unzip it.
   - **Windows:** right-click the file, choose **Extract All**, then **Extract**.
   - **Mac:** double-click the file.
4. You now have a folder called `accountable-mail-site`. Open it. You should see `index.html`,
   `about.html`, a folder called `assets`, and about a dozen other items.

**Check your work:** double-click `index.html`. Your web browser should open and show the site. It
will look exactly as it will online. This is your local copy, and only you can see it.

---

## Step 2. Create the repository

A repository, or "repo," is just a folder that lives on GitHub.

1. Go to **github.com** and sign in.
2. Click the **+** in the top right corner, then **New repository**.
3. Fill in:
   - **Repository name:** `accountable-mail` (lowercase, no spaces)
   - **Description:** optional, leave blank if you like
   - **Public** or **Private:** you must choose **Public**. Free GitHub accounts can only publish
     websites from public repositories.
   - **Add a README file:** leave this **unchecked**. It creates a file that will get in your way.
   - Leave `.gitignore` and license set to **None**.
4. Click **Create repository**.

You now have an empty repo, and GitHub is showing you a page full of command line instructions.
**Ignore all of it.** Look for a line that says something like "uploading an existing file" and note
that it exists, or just continue to Step 3.

> **If you already created a repo earlier and it has a README file in it**, that is fine. Continue to
> Step 3 and upload on top of it. If a conflict appears, choose to keep the incoming files.

---

## Step 3. Upload the files

1. On your repository page, click **Add file** near the top right, then **Upload files**.
2. Open the `accountable-mail-site` folder on your computer in a separate window.
3. **Select everything inside that folder.** Not the folder. The contents.
   - **Windows:** click inside the folder, then press `Ctrl` + `A`
   - **Mac:** click inside the folder, then press `Cmd` + `A`
4. Drag the selected items onto the GitHub upload area in your browser.
5. Wait. The `assets` and `scripts` folders come along automatically. You should see roughly 19 items
   listed when it finishes.
6. Scroll to the bottom. In the box under **Commit changes**, type something like
   `Initial site upload`.
7. Click the green **Commit changes** button.

**Check your work:** your repository page should now list `index.html`, `about.html`, `assets`, and
the rest, directly. If instead you see a single folder named `accountable-mail-site`, go to Step 6
for the fix.

---

## Step 4. Turn on the website

1. On your repository page, click **Settings** in the top row of tabs. It is on the right, near
   "Insights."
2. In the left sidebar, scroll down and click **Pages**.
3. Under **Build and deployment**:
   - **Source:** choose **Deploy from a branch**
   - **Branch:** choose **main**
   - **Folder:** choose **/ (root)**
4. Click **Save**.
5. Wait two to three minutes. Refresh the page.

A green banner appears at the top with your website address. It looks like:

```
https://YOURUSERNAME.github.io/accountable-mail/
```

Click it. Your site is live on the internet.

---

## Step 5. Confirm it worked

Open the address and check three things:

| Check | If it fails |
| --- | --- |
| The page loads and looks styled, with navy headers and the round stamp | See Step 6 |
| Clicking "Knowledge center" in the menu goes to another page | See Step 6 |
| You see a "404 File not found" page | See Step 6 |

If the page loads but looks like plain black text on white with no colors, the `assets` folder did
not upload. Repeat Step 3 and make sure `assets` appears in your repository.

---

## Step 6. Fixing the folder mistake

If your repository shows a single folder called `accountable-mail-site` instead of the files:

1. Click into the `accountable-mail-site` folder on GitHub.
2. You cannot move files in the GitHub web interface, so the fastest fix is to start over. Go to
   **Settings**, scroll all the way to the bottom, click **Delete this repository**, and follow the
   prompts.
3. Repeat Steps 2 and 3, this time selecting the files **inside** the folder.

It takes four minutes and it is less painful than any workaround.

---

## Step 7. Making changes later

Every time you want to edit the site:

**To change words on an existing page**
1. Go to your repository and click the file, for example `index.html`.
2. Click the **pencil icon** in the top right.
3. Edit the text. The words are between the angle brackets. For example, in
   `<h3>Certified Mail</h3>`, you can safely change `Certified Mail`. Leave the `<h3>` and `</h3>`
   parts alone.
4. Scroll down, type a short note in the commit box, and click **Commit changes**.
5. Your live site updates in about a minute.

**To add a whole new page**
1. Click **Add file**, then **Upload files**, and drag the new HTML file in.
2. Commit.

**To replace everything at once**
1. Click **Add file**, then **Upload files**.
2. Drag in the updated files. Files with the same name are replaced automatically.
3. Commit.

> **Safe to experiment.** GitHub keeps every version of every file forever. Click the **History**
> button on any file to see past versions and restore one. You cannot permanently break anything.

---

## Step 8. Your own domain name, when you are ready

Skip this until you have bought `accountablemail.org` or whichever name you choose.

1. Buy the domain from any registrar. Done.
2. A `CNAME` file already exists in the repository root containing `accountablemail.org`. If you
   registered a different name, edit that file; it must contain only the domain, with no
   `https://` and no `www`.
3. Skip to step 6 if the file is already correct.
4. To recreate it: **Add file**, **Create new file**, name it exactly `CNAME` in capitals with no
   extension, and put only the domain in the body.
5. Commit.
6. At your domain registrar, find the DNS settings and add these records. The four A records are
   required. The four AAAA records are IPv6 and are recommended, not required. The CNAME makes
   `www` work as well as the bare domain.

   | Type | Name or Host | Value |
   | --- | --- | --- |
   | A | @ | 185.199.108.153 |
   | A | @ | 185.199.109.153 |
   | A | @ | 185.199.110.153 |
   | A | @ | 185.199.111.153 |
   | AAAA | @ | 2606:50c0:8000::153 |
   | AAAA | @ | 2606:50c0:8001::153 |
   | AAAA | @ | 2606:50c0:8002::153 |
   | AAAA | @ | 2606:50c0:8003::153 |
   | CNAME | www | YOURUSERNAME.github.io |

   If your registrar created a default A record or a parking-page record for `@`, delete it first.
   Do not use a wildcard record such as `*.accountablemail.org`; GitHub warns that wildcards expose
   you to domain takeover.

7. Verify the domain first. Under your GitHub profile **Settings**, then **Pages**, add and verify
   `accountablemail.org`. GitHub gives you a TXT record to add at your registrar. This is optional
   but GitHub recommends it, because it prevents anyone else from pointing the domain at their own
   repository if yours is ever removed.
8. Go back to the repository **Settings**, then **Pages**, type your domain into the **Custom
   domain** box, and click **Save**. The `CNAME` file in the repository already contains the domain,
   so this step should validate quickly.
9. Wait. DNS can take up to 24 hours. Once the **Enforce HTTPS** checkbox becomes available, tick
   it. If HTTPS fails on either the bare domain or `www`, remove the custom domain, save, re-add it,
   and save again; that forces GitHub to reissue a certificate covering both.

Confirm those four IP addresses against GitHub's current documentation before you rely on them,
because GitHub does change them occasionally.

---

## Two things you can safely ignore for now

The `README.md` file in this folder has sections on a "pre-commit hook" and a "GitHub Action." Those
are for developers and they are optional. Your site works without them. Come back to them later, or
never.

The `scripts/check.sh` file is a quality check that requires a command line. Also optional. The rule
it enforces is simple enough to follow by hand: **no company or product names anywhere on the site,
except USPS systems.**

---

## If you just want to see it live right now

Before dealing with GitHub at all, you can put the site online in about thirty seconds to see how it
looks:

1. Go to **app.netlify.com/drop**
2. Drag your entire `accountable-mail-site` folder onto the page
3. You get a live web address immediately

That address is temporary and randomly named, and it is not where the real site should live. But it
is a fast way to see the finished thing on a real URL, and to show it to someone before you commit to
the full setup.
