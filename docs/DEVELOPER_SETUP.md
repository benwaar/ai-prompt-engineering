# Developer setup — getting this project working on a new machine

This document lists the minimal steps and useful commands (PowerShell) to set up this repo on a fresh machine. It assumes you have Git installed. Where Node/npm is optional, steps are clearly marked.

1) Clone the repo

```powershell
git clone <repo-url> # replace with your clone URL
cd utala_card_back
```

2) Configure Git identity (one-time per machine)

```powershell
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

3) (Optional) Install Node.js and npm

This repo includes `package.json` and devDependencies for commitlint/husky. If you want the npm-based hook workflow, install Node.js (LTS) from https://nodejs.org and ensure `npm` is on PATH.

Verify:

```powershell
node -v
npm -v
```

4) Install npm dependencies and enable Husky (if using npm)

```powershell
npm install
npm run prepare
# Install a commit-msg hook that runs commitlint
npx husky add .husky/commit-msg "npx --no -- commitlint --edit \"$1\""
```

5) If you don't want npm / Husky, install the tracked plain Git hook (recommended fallback)

This repo contains `scripts/commit-msg-hook.sh`. Copy it into your local `.git/hooks/` and make it executable:

```powershell
cp .\scripts\commit-msg-hook.sh .git\hooks\commit-msg
icacls .git\hooks\commit-msg /grant %USERNAME%:RX
```

6) Useful Git commands (conventional commits)

- Stage changes:

```powershell
git add .
```

- Commit with Conventional Commit message:

```powershell
git commit -m "docs(getting-started): add guide"
```

- View recent commits:

```powershell
git --no-pager log -n 10 --pretty=format:"%h %s (%an, %ad)" --date=short
```

7) Prompt / render workflow (quick)

- Edit or create prompts under `prompts/`.
- Run your preferred generator (DALL·E / Midjourney / local model). Save outputs under `renders/`.
- Add files and commit with a descriptive conventional commit message that ties prompt → image (example below):

```powershell
git add prompts renders docs
git commit -m "back v1: base render with yellow/blue/brown → green core; embossed UTALA"
```

8) License and images

- See `LICENSE` for terms. Code and prompt text are permissively granted; image assets are copyrighted by 1311.uk.

9) Troubleshooting

- "npm not found": install Node.js LTS and re-open PowerShell.
- Commit failing due to hook: run `git commit` with a valid Conventional Commit message (types: feat, fix, docs, chore, etc.). If you want to bypass for a single commit: `git commit --no-verify -m "..."` (not recommended).

10) Optional helper (one-liner to install tracked hook and set permissions)

```powershell
cp .\scripts\commit-msg-hook.sh .git\hooks\commit-msg ; icacls .git\hooks\commit-msg /grant %USERNAME%:RX
```

That's it — once set up you can run the prompt pipelines and keep prompts and renders in sync via Git commits.
