# 🧭 AI Art Prompt-Engineering Study Plan  
### Procedural Creativity • Visual Pipelines • Modular Design Thinking

---

## **Phase 1 – Foundations · Thinking in Modules**
**Goal:** understand how DALL·E (and similar models) interpret structured language.

**Concepts**
- Core modules: `[COMPOSITION]`, `[SUBJECT]`, `[STYLE]`, `[COLOR]`, `[TEXTURE]`, `[LIGHTING]`, `[MOOD]`, `[DETAILS]`, `[OUTPUT]`
- Geometry constraints · ratio statements · symmetry
- Vocabulary seeding · style tokens
- Reference-anchored prompting · seed reuse
- STYLE / MOOD / TEXTURE as independent toggleable layers

**Exercises**
1. Write one prompt using all core blocks.  
2. Generate three images changing **only [COLOR]**.  
3. Write geometry specs (“object = ¼ canvas height”).  
4. Upload a reference; vary one structural parameter.  
5. Observe visual drift when STYLE / MOOD / TEXTURE are toggled individually.  

---

## **Phase 2 – Style & Surface · Visual Semantics**
**Goal:** develop control over aesthetics and surface feel.

**Concepts**
- Reversible layers: STYLE ↔ TEXTURE ↔ MOOD  
- Color harmony · value mapping · grayscale readability  
- Texture vocab: distressed / halftone / risograph / grain  
- Lighting direction · material realism  

**Exercises**
1. Render same subject in three style eras (’70s retro, Bauhaus, Y2K).  
2. Swap only TEXTURE layer (10 % vs 40 % wear).  
3. Compare grayscale clarity across all variants.  

---

## **Phase 3 – Prompt as Code · Macro Thinking**
**Goal:** treat prompts as composable functions.

**Concepts**
- JSON macro set structure  
- Prompt DSL syntax: `>`, `//`, `:`, `[]`, `--`  
- Iteration ladder (v1 → v1.3) & version tags  
- Negative prompting · output constraints  
- Prompt archive + changelog discipline  
- Environment Header (declare macros once per project)

**Exercises**
1. Build one base JSON macro file and generate 5 subjects from it.  
2. Implement `NEGATIVE` block to forbid unwanted effects.  
3. Document each iteration (v1.x) with notes & seed.  

---

## **Phase 4 – Advanced Pipelines**
**Goal:** master multi-pass generation and consistency control.

**Concepts**
- Multi-pass workflow: composition → style → texture → lighting  
- Reference image anchoring & seed reuse  
- Inpainting / regional editing passes  
- Programmatic macro assembly (ComfyUI, ChatGPT → DALL·E scripts)  
- Feedback loop rule (change ≤ 2 parameters per run)  
- Reverse-layer testing (toggle STYLE, MOOD, TEXTURE separately)  

**Exercises**
1. Multi-pass generation A/B/C; record deltas.  
2. Lock SUBJECT; iterate only `[TYPO]` + background.  
3. Masking exercise – edit aura only.  
4. A/B batch: palette A vs B, texture 20 % vs 35 %.  

---

## **Phase 5 – Print-Ready Thinking**
**Goal:** build outputs suitable for real production.

**Concepts**
- Spot-color discipline · grayscale separation  
- Halftone simulation · overprint planning  
- Edge cleanup · vectorization · path simplification  

**Exercises**
1. Limit to 3–4 inks; verify value contrast.  
2. Export → vectorize → inspect at 150 %.  
3. QA check: edges, registration, grain consistency.  

---

## **Phase 6 – Visual Bible & Asset Library**
**Goal:** ensure global consistency across projects.

**Concepts**
- Style Bible (visual DNA)  
- Folder architecture (`/Style_Bible/ /Prompts/ /Generated/ /Finals/`)  
- Style token reuse · macro index · seed tracking  
- “Base Style Block” reuse (e.g., Utala header)  

**Exercises**
1. Compile palette (hex), line weights, texture % into a Style Card.  
2. Generate coordinated set (T-shirt, poster, sticker).  
3. Verify color / texture consistency across all assets.  

---

## **Phase 7 – Quality Gates & Review**
**Goal:** audit, document, and maintain creative reproducibility.

**Checklist**
- Thumbnail legibility · grayscale map · text spacing  
- Edge cleanup · no unintended gradients  
- Prompt archive + metadata stored with file  
- Visual consistency vs Style Bible  

---

## **Appendix A – Workflow Hygiene**
- File naming pattern: `Project_Element_vX.Y_modifier.png`  
- Folder tree discipline · seed logs  
- Environment Header macro at top of each prompt document  

---

## **Appendix B – Macro Header Template (Example Utala)**
```text
###############################################################
# U T A L A  •  M A C R O  D E C L A R A T I O N  H E A D E R
###############################################################

[BASE_STYLE]
In the established *Utala* visual style — sacred geometry + sci-fi minimalism.  
Perfect symmetry, fine etched lines, matte graphite texture, luminous engraving.

[COLOR_SYSTEM]
Yellow = Body | Blue = Mind | Brown = Memory | Green = Unity.

[MATERIAL_BLOCK]
Surface = matte graphite / brushed metal | Lighting = diffuse glow.

[FX_GLOW]
Subtle green inner aura — soft, no bloom.

[MOOD_BLOCK]
Calm power · sacred technology · harmony through structure.

[PRINT_SPECS]
High contrast · vector clarity · foil/matte ready · ≥ 4K render.
```
