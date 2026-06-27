# `docs/` — How to store your documents

> Practical guide for every BA team member. The formal rule is
> [.claude/rules/docs-storage.md](../.claude/rules/docs-storage.md). All document
> content is written in **English**.

## The two zones

```
docs/
├── README.md                       ← this guide
├── <your-github-login>/            ← YOUR personal working area (drafts, notes)
│   └── day<N>/
│       └── ...your files...
└── share/                          ← official team deliverables (PR + approval)
    ├── charter/
    ├── stakeholder-register/
    ├── brd/
    ├── srs/
    ├── user-stories/
    ├── use-cases/
    ├── process-diagrams/
    ├── wireframes/
    ├── data-dictionary/
    └── test-cases/
```

| | Personal | Shared |
|---|---|---|
| **Path** | `docs/<your-login>/day<N>/` | `docs/share/<artifact>/` |
| **For** | drafts, daily work, research, meeting prep | the canonical, reviewed deliverable |
| **Owner** | only you | the team |
| **Review** | none — your scratch space | **PR + BA Lead approval required** |

## Your personal folder

Use your **GitHub login** (exact case) as the folder name:

| You | Your folder |
|---|---|
| Kiều Quang Vân | `docs/unkaidev/` |
| Phan Thành Lộc | `docs/Codename-Lok/` |
| Huỳnh Ngọc Thiện | `docs/thienhn22git-cloud/` |
| Tô Duy Bắc | `docs/duybac210/` |
| Nguyễn Thị Phương Thảo | `docs/nickhocbaicuathao-lab/` |

Group files by **project day** (`day1` = 2026-06-24 kickoff):

```
docs/unkaidev/day3/brd-functional-reqs-draft.md
```

> Only commit into **your own** folder. Don't touch a teammate's folder.

## Promoting a draft to an official document

1. Draft in `docs/<your-login>/day<N>/...`.
2. When it's ready, open a PR that puts the final file under the matching
   `docs/share/<artifact>/` (see [CONTRIBUTING.md](../CONTRIBUTING.md)).
3. Request review from the BA Lead (`@unkaidev`). On approval it merges to
   `develop`.

Only `docs/share/` (and the top-level `rtm/`) holds the canonical copy that
eventually reaches `main`.

## Naming files

- kebab-case, lowercase, no spaces: `data-dictionary-residents.md`
- version shared deliverables: `brd-v0.1.md`, `brd-v1.0.md`
- diagrams/wireframes: keep the source **and** an exported `.png`/`.pdf`

Full rules and the artifact-to-scope mapping:
[.claude/rules/docs-storage.md](../.claude/rules/docs-storage.md).
