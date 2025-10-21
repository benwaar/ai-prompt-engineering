# Utala Card Back

Prompt-engineering exercise using ChatGPT and DALL·E to create a card-back image for the "Utala" Trading Card Game.

This repository stores prompt resources, macros, and rendered assets produced while iterating on the card-back design.

## Contents

- `prompts/` — prompt text and macros used to generate images.
- `renders/` — final and intermediate render outputs (backgrounds, emblems, backs).
- `docs/` — notes and changelog.
- [Getting Started](docs/GETTING_STARTED.md) — step-by-step guide to run a pipeline and record results.

## Included

- Getting started guide: `docs/GETTING_STARTED.md`
- Tracked commit-msg hook: `scripts/commit-msg-hook.sh` (copy to `.git/hooks/commit-msg` to enable)
- Commitlint/Husky config placeholder: `package.json`, `commitlint.config.cjs` (requires Node/npm to activate)
- License: [LICENSE](LICENSE)

## Usage

This project is primarily a collection of prompts and images. To reproduce or continue work:

1. Edit or create new prompt files in `prompts/`.
2. Use your preferred image-generation workflow (DALL·E, Midjourney, local models) with the prompt text.
3. Add resulting images to `renders/` and update `docs/CHANGELOG.md` with notes about iterations.

## Notes

- Files in this repo may contain iterative drafts and experimental prompts.
- No executable code is included — this is a design asset repository.

## Commit message hook (optional)

This repo includes a tracked commit-msg hook script at `scripts/commit-msg-hook.sh` that enforces Conventional Commits.

To install the hook locally (without npm/husky):

1. Copy the tracked script into your local Git hooks folder and make it executable:

```powershell
cp .\scripts\commit-msg-hook.sh .git\hooks\commit-msg
icacls .git\hooks\commit-msg /grant %USERNAME%:RX
```

2. Now your commits will be validated for Conventional Commit format. If you prefer an npm-based setup, install Node.js and run `npm install` then `npm run prepare`.

## License

See [LICENSE](LICENSE) for terms. Code and prompt text are provided under a permissive
grant; image assets are copyrighted by 1311.uk and excluded from that grant unless
otherwise specified.
