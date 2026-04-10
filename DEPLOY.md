# Hobby Debt Ledger — Deploy

## Day-to-day

1. Edit files in **`public/`** (this is the only place the app code lives)
2. Double-click **`deploy.bat`**
3. Type a commit message (or press Enter for an auto timestamp)
4. Wait — it commits, pushes, and deploys

Live URLs:
- Main app: https://hobby-debt-ledger.web.app
- Forge admin: https://hobby-debt-ledger.web.app/forge

---

## What `deploy.bat` does

```
git add .
git commit -m "<your message>"
git push            (warns if it fails, doesn't block)
firebase deploy --only hosting
```

If `git push` fails (network / auth), it still deploys so your fix gets live. Run `git push` manually afterwards.

---

## File structure

```
hobby-debt-ledger/
├── public/                      ← the ONLY place to edit app code
│   ├── hobby-debt-ledger.html   ← main app
│   ├── forge-admin.html         ← admin tool
│   ├── gw-images.json           ← image data
│   ├── hdl-manifest.json        ← PWA manifest (main)
│   ├── forge-manifest.json      ← PWA manifest (forge)
│   ├── sw-hdl.js                ← service worker (main)
│   └── sw-forge.js              ← service worker (forge)
├── firebase.json                ← hosting config
├── .firebaserc                  ← project binding
├── deploy.bat                   ← one-click deploy
└── DEPLOY.md                    ← this file
```

There used to be duplicate copies of `hobby-debt-ledger.html`, `forge-admin.html`, and `gw-images.json` at the root level. They've been deleted — **only edit in `public/`**.

---

## First-time setup (one off)

Install:
- Git: https://git-scm.com/download/win
- Node.js LTS: https://nodejs.org
- Firebase CLI: `npm install -g firebase-tools`

Then:
```
firebase login
```

You're done. From now on, just run `deploy.bat`.
