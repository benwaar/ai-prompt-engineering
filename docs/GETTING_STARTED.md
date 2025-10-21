🧩 1. Pick which pipeline you want to run first

Let’s say you start with the card back.

Open this file:

`prompts/pipelines/card_back_v1.md`

🪶 2. Bring in your base macros

At the very top of that file, copy the contents of
`prompts/macros/base_style.md`.

Then, below that, keep the pipeline body.


It’ll look like this:

```
# Pipeline: Card Back v1
# -----------------------------------------------------
# MACROS (imported)
[UTALA_BASE_STYLE]
Sacred geometry + sci-fi minimalism. Perfect symmetry. Fine etched lines inspired by Toki Pona glyphs and circuit traces. Matte graphite / brushed metal texture with faint luminous engraving.

[PRINT_SPECS]
High contrast, grayscale-legible, foil/matte ready. Ultra-high resolution (≥4K). Clean vector-like edges.

[COLOR_SYSTEM]
Yellow = Body, Blue = Mind, Brown = Earth/Memory, Green = Unity (glow accent). Colors restrained; overlaps subtle.

[GLYPH_RULES]
Radial/circular flow. Subtly include “1” ~20% and “3” ~10% among glyphs; blend into etching.

[MOOD]
Sacred technology, calm precision, harmony through structure.
# -----------------------------------------------------
# PIPELINE
> [UTALA_BASE_STYLE]
> [PRINT_SPECS]
> [COLOR_SYSTEM]

[COMPOSITION]
Symmetrical card back with interlocking yellow, blue, and brown geometry converging to a green central convergence symbol. Central embossed "UTALA" in sleek uppercase sans serif.

[DETAILS]
Zen brush rings + thin sci-fi circuit tracery + faint Toki Pona glyphs along border. Maintain rotational symmetry. Strong separation in grayscale.

[MOOD]
[MOOD]

[OUTPUT]
Render on matte graphite base, subtle embossed depth. Save as PNG.
```

🧭 3. Generate your first render

Copy everything from this file.

Paste it into DALL·E’s prompt box.

Run it and save the result to:

`renders/backs/utala_back_v1_2025-10-21.png`


(or whatever today’s date/version is)

🗂️ 4. Commit it all

In your terminal inside the repo:

```bash
git add prompts renders docs
git commit -m "back v1: base render with yellow/blue/brown → green core; embossed UTALA"
```

This locks in both the prompt and the image together.

🧾 5. Record what you did

Open `docs/CHANGELOG.md` and add:

```
## 2025-10-21
- back v1: base render with yellow/blue/brown → green core; embossed UTALA; matte graphite texture

✅ Done!
```

Now you have:

One full recorded pipeline (prompt + macro + image)

A Git snapshot to return to anytime

A baseline for v1.1 (next iteration)
