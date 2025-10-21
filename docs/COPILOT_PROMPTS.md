# Copilot prompts — ready-to-copy DALL·E templates and process


Purpose: provide a single place where Copilot (or any collaborator) can find copy/paste-ready prompts for DALL·E, Midjourney, or other generators. Keep prompts explicit, deterministic, and include a short negative/constraints section.

Assistant behavior (important)

- By default: do NOT expand macros when producing a copy/paste prompt block. Provide the pipeline with macro placeholders (e.g., `[UTALA_BASE_STYLE]`) so the prompt stays compact and easy to audit.
- If the user explicitly requests debugging or expansion (for example by saying "debug prompt"), expand macros inline so the full expanded prompt is shown.
- Alternatively, use the provided helper script `scripts/expand_prompt.ps1` to generate an expanded or compact prompt and copy it to the clipboard for pasting into DALL·E.

How to use

1. Copy the prompt block you want.
2. Paste into the generator prompt box (or into your UI's prompt field).
3. Use the suggested generator settings below when applicable.

General rules for prompts

- Start with macros if available (e.g., `[UTALA_BASE_STYLE]`).
- Include PRINT_SPECS and COLOR_SYSTEM sections when generating assets intended for print or tight color systems.
- Add `[NEGATIVE]` or `--no` settings to avoid people, faces, or unwanted textures.
- Specify exact output size and format when the UI supports it (e.g., PNG, transparent BG, 4K).

Example: Emblem (full multiline, recommended)

```
[UTALA_BASE_STYLE]
Sacred geometry + sci-fi minimalism. Perfect symmetry. Fine etched lines inspired by Toki Pona glyphs and circuit traces. Matte graphite / brushed metal texture with faint luminous engraving.

[PRINT_SPECS]
High contrast, grayscale-legible, foil/matte ready. Ultra-high resolution (≥4K). Clean vector-like edges. Transparent background preferred.

[COLOR_SYSTEM]
Primary: graphite / brushed metal. Accent glow: green = Unity. Small gold/brass highlights; subtle cyan rim. Colors restrained; overlaps subtle.

[GLYPH_RULES]
Radial/circular flow. Subtly include “1” ~20% and “3” ~10% among glyphs; blend into etching.

[MOOD]
Sacred technology, calm precision, harmony through structure.

# PIPELINE
> [UTALA_BASE_STYLE]
> [PRINT_SPECS]
> [COLOR_SYSTEM]

[COMPOSITION]
Centered circular emblem, perfect radial symmetry. Concentric rings and interlocking geometry converging to a central convergence symbol. Clean, embossed/debossed relief with fine etched tracery. Central mark simple and readable at small sizes.

[DETAILS]
Matte graphite base with brushed-metal bevels; extremely fine sci‑fi circuit tracery and faint Toki Pona glyph etching in the rings. Soft green inner glow at the convergence symbol; tiny gold/brass accents.

[OUTPUT]
Square PNG, transparent background, 4096×4096 px, high-detail, no watermark, maximum fidelity for linework.

[NEGATIVE]
No faces, no animals, no busy photographic backgrounds, avoid heavy grain, no text overlays or logos other than subtle embedded glyphs.
```

Compact (single-line) emblem prompt

```
Centered circular emblem, sacred geometry + sci-fi minimalism, fine etched lines and circuit tracery, matte graphite brushed-metal base, soft green inner glow at central convergence, tiny gold accents, embossed relief, vector edges, 4096x4096 PNG transparent background, no watermark, --no people --no text
```

Card back pipeline (copy/paste)

```
# Pipeline: Card Back v1
> [UTALA_BASE_STYLE]
> [PRINT_SPECS]
> [COLOR_SYSTEM]

[COMPOSITION]
Symmetrical card back with interlocking yellow, blue, and brown geometry converging to a green central convergence symbol. Central embossed "UTALA" in sleek uppercase sans serif.

[DETAILS]
Zen brush rings + thin sci-fi circuit tracery + faint Toki Pona glyphs along border. Maintain rotational symmetry. Strong separation in grayscale.

[OUTPUT]
PNG, 4096×4096, matte graphite base, save to renders/backs/utala_back_v1_2025-10-21.png

[NEGATIVE]
No photorealistic textures, no people, avoid heavy grain.
```

Suggested generator settings

- DALL·E: paste the full prompt, choose transparent background and highest resolution.
- Midjourney: append `--ar 1:1 --v 5 --q 2 --no people --no text` (adjust flags for your MJ version).
- Stable Diffusion: 4096×4096 (or 2048 + upscale), 30–60 steps, CFG 7–9.

Saving and versioning

- Save outputs into `renders/` with descriptive filenames.
- Commit prompt files and renders together to preserve prompt → output traceability.

Keep this doc small and canonical — Copilot should use it as the source of truth for copy/paste prompts.

Running the prompt helper from VS Code

You can run two tasks from VS Code's "Run Task" palette (Ctrl+Shift+P → "Tasks: Run Task"):

- "Prompt: Copy compact prompt" — copies the compact prompt (macros left as placeholders) to clipboard.
- "Prompt: Copy expanded prompt" — copies the full expanded prompt (macros inlined) to clipboard.

These tasks call `scripts/expand_prompt.ps1` and require PowerShell to be available in the PATH.
