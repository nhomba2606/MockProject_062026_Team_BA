# Contributing Guide — Pull Requests & Closing Issues

> Audience: every BA team member (Fresher BA + Deputy Lead).
> Goal: a step-by-step recipe to open a **correct** Pull Request and **close an issue
> correctly** under this project's current GitHub format.
> Language: all GitHub content (branches, commits, PRs, comments) is written in **English**.

This guide is the practical companion to the [README](README.md) sections
*GitHub Workflow*, *Branch Naming Convention*, and *Commit Convention*. Read it once
before your first PR.

---

## 0. The one rule that catches everyone

This repo has **two long-lived branches**:

| Branch | Role |
|---|---|
| `main` | Production / signed-off documents only — **this is the GitHub default branch** |
| `develop` | Integration branch — **your PRs merge here**, not into `main` |

GitHub only **auto-closes** an issue from a PR keyword (`Closes #12`) when that PR merges
into the **default branch (`main`)**. Because your PR merges into **`develop`**, the
keyword will **not** close the issue automatically at merge time.

➡️ **Therefore: after your PR is merged into `develop`, you must close the linked issue
manually** (see [Section 5](#5-closing-the-issue-correctly)). Keep the `Closes #N`
keyword anyway — it creates the visible link and will finalize the issue when
`develop` is merged into `main` at the milestone end.

---

## 1. Pick an issue from the board

1. Open the [Kanban board](https://github.com/users/nhomba2606/projects/1).
2. Pick an issue **assigned to you**. Note its number (e.g. `#14`).
3. Move its card to **In Progress** so the team sees you started.

> Note: standup `[Day N]` issues that are *not* document work (e.g. "explore Figma",
> "research the domain") usually have **no PR**. For those, skip to
> [Section 5b — Closing a non-PR task issue](#5b-closing-a-non-pr-task-issue).

---

## 2. Create your branch (from `develop`)

Always branch from an up-to-date `develop` — **never** from `main`.

```bash
git checkout develop
git pull origin develop
git checkout -b <type>/<sprint>/<short-description>
```

**Branch name format:** `<type>/<sprint>/<short-description>`

| `<type>` | Use for |
|---|---|
| `feat`   | New document or major section |
| `update` | Revision to an existing document |
| `review` | Review-cycle changes |
| `fix`    | Correction after feedback |
| `chore`  | Repo maintenance (templates, scripts) |

```
Examples:
  feat/s2-brd-section-3
  update/s3-srs-nfr-007
  fix/s3-use-case-UC-004
```

---

## 3. Do the work & commit

Save documents in the **correct `docs/` subfolder** (see README → *Repository Structure*).

**Commit format:** `<type>(<scope>): <short description>`

- `<type>`: `feat | update | review | fix | chore | docs`
- `<scope>`: `brd | srs | us | wf | dd | uc | bpd | tc | rtm | charter`

```bash
git add docs/03-brd/brd.md
git commit -m "feat(brd): add Section 4 - Functional Requirements"
git push -u origin feat/s2-brd-section-4
```

> Do **not** add `Co-Authored-By` / "Generated with" lines. Commits read as authored by you.

---

## 4. Open the Pull Request

1. After `git push`, open the repo on GitHub and click **Compare & pull request**.
2. **Set the base branch to `develop`** (GitHub may default to `main` — change it).
   - Base: `develop`  ←  Compare: `feat/s2-brd-section-4`
3. Title: same convention as a commit, e.g. `feat(brd): add Section 4 - Functional Requirements`.
4. The [PR template](.github/PULL_REQUEST_TEMPLATE.md) auto-fills the body. Complete **every** part:
   - **Summary** — one sentence.
   - **Document Details** table — Document Type, Sprint (`S2`), Milestone (`M2`),
     **Related Issue → `Closes #14`**, Section(s) changed.
   - **Type of Change** — tick the matching box.
   - **What Changed** / **Reason for Change** — bullet points.
   - **Author Checklist** — tick each item honestly (correct folder, template followed,
     branch & commit conventions, labels applied, issue linked).
5. **Labels** — apply on the PR: the document `type:*`, the `sprint:N`, and a `status:*`
   (start with `status:In-Review`). Priority/area labels if relevant.
   ⚠️ Do **not** add a `task:*` progress label — those are set by the BA Lead at review.
6. **Reviewers** — request review from **@unkaidev** (BA Lead). No merge happens without
   at least 1 approving review from the BA Lead (branch protection enforces this).

### Linking the issue — exact keyword

Put this on its own line in the **PR description** (the `Related Issue` row already does this):

```
Closes #14
```

Accepted keywords: `Closes`, `Fixes`, `Resolves` + `#<number>`. This creates the
issue↔PR link. (Reminder from Section 0: because we merge to `develop`, the actual
close is manual — next section.)

---

## 5. Closing the issue correctly

### 5a. Document task (had a PR)

1. BA Lead reviews. If changes are requested, the PR gets `status:Needs-Revision` —
   push fixes to the **same branch**, the PR updates automatically.
2. On approval, the BA Lead (or you, once approved) **merges the PR into `develop`**.
3. **Immediately close the linked issue manually**, because the auto-close does not
   fire on a `develop` merge:

   ```bash
   gh issue close 14 --comment "Done — merged into develop via #<PR-number>."
   ```

   Or on the web: open issue `#14` → **Close issue** → leave a comment naming the PR.
4. Move the issue card to **Done** on the board.

> Why manual? See [Section 0](#0-the-one-rule-that-catches-everyone). The `Closes #14`
> keyword stays in the PR so the link is recorded; GitHub will simply have nothing left
> to close when `develop` → `main` happens at milestone end.

### 5b. Closing a non-PR task issue

Standup `[Day N]` action items (research, exploration, meetings) have no document/PR.
Close them when the work is reported done:

```bash
gh issue close 9 --comment "Completed: <one line on the outcome>."
```

Always leave a closing comment stating the outcome — never close silently.

> ⚠️ Do **not** apply or change `task:*` progress labels yourself. On-time / Delayed /
> Over-Progress are set by the **BA Lead at the Daily Scrum review** only.

---

## 6. Quick checklist (pin this)

**Before opening the PR**
- [ ] Branched from `develop` (not `main`)
- [ ] Branch name = `type/sprint/desc`
- [ ] Commits = `type(scope): desc`
- [ ] File in the right `docs/` subfolder

**In the PR**
- [ ] Base branch = `develop`
- [ ] PR template fully filled
- [ ] `Closes #<issue>` in the description
- [ ] Labels applied (`type:*`, `sprint:N`, `status:In-Review`) — **no `task:*`**
- [ ] Reviewer = `@unkaidev`

**After merge to `develop`**
- [ ] **Manually close the linked issue** with a comment naming the PR
- [ ] Issue card moved to **Done**

---

## 7. Handy `gh` commands

```bash
# See your assigned open issues
gh issue list --assignee @me --state open

# Open a PR from the CLI (base = develop)
gh pr create --base develop --title "feat(brd): add Section 4" --body "Closes #14"

# Check PR status / reviews
gh pr status

# Close an issue with a comment after the PR is merged to develop
gh issue close 14 --comment "Done — merged into develop via #21."
```

---

*Maintained by the BA Lead. Questions → ping @unkaidev in the team channel.*
