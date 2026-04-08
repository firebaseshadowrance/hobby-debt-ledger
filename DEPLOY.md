# Hobby Debt Ledger — Deployment Guide

## First-time setup (one off)

### 1. Install prerequisites
- **Git**: https://git-scm.com/download/win
- **Node.js** (LTS): https://nodejs.org
- **Firebase CLI**: open a terminal and run:
  ```
  npm install -g firebase-tools
  ```

### 2. Log in to Firebase
```
firebase login
```
This opens a browser window — sign in with the Google account that owns the `hobby-debt-ledger` Firebase project.

### 3. Initialise the git repo
Open a terminal in the `hobby-debt-ledger` folder (right-click → "Git Bash Here" or open Command Prompt and `cd` to it), then run:
```
git init -b main
git add .
git commit -m "Initial commit"
```

### 4. Create the GitHub repo and push
Go to https://github.com/new and create a repo called `hobby-debt-ledger` (private is fine, no README/gitignore needed).

Then back in the terminal:
```
git remote add origin https://github.com/YOUR_USERNAME/hobby-debt-ledger.git
git push -u origin main
```

---

## Deploying

From the `hobby-debt-ledger` folder, run:
```
firebase deploy --only hosting
```

Your app will be live at:
- **Main app**: https://hobby-debt-ledger.web.app
- **Forge admin**: https://hobby-debt-ledger.web.app/forge

---

## After making changes

1. Edit the files in `public/`
2. Run `firebase deploy --only hosting`
3. Optionally commit and push to GitHub:
   ```
   git add .
   git commit -m "describe your change"
   git push
   ```

---

## File structure

```
hobby-debt-ledger/
├── public/
│   ├── hobby-debt-ledger.html   ← main app
│   ├── forge-admin.html         ← admin tool
│   ├── hdl-manifest.json        ← PWA manifest for main app
│   ├── forge-manifest.json      ← PWA manifest for Forge
│   ├── sw-hdl.js                ← service worker for main app
│   └── sw-forge.js              ← service worker for Forge
├── firebase.json                ← hosting config
├── .firebaserc                  ← project ID binding
└── .gitignore
```
