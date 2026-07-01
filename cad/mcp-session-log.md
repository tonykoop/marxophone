# MCP Session Log

No MCP, CAD, rendering, Illustrator, Photoshop, Blender, OpenSCAD, Fusion,
SolidWorks, CAM, measurement, tuner, string test, spring test, hammer action
test, or acoustic simulation session was run for the original Round 7 L1
scaffold or this L2 uplift.

QMD Step 0 was run from `/mnt/c/Users/Tony/Documents/GitHub` with:

```text
qmd query "marxophone Marxophone — a fretless zither played with spring-mounted metal hammers that bounce on the strings when keys are pressed, giving a mandolin-like tremolo; hammer arm dynamics, string courses"
```

Observed result: qmd printed the node-llama-cpp Vulkan fallback line, generated
lexical/vector/hypothetical search variants, reported `Searching 6 queries...`,
then reached `Reranking 39 chunks...`. The command timed out after 30 seconds
before returning usable context.

Additional Round 7 L2 uplift Step 0 command:

```text
qmd search "marxophone" -c instrument-builds
```

Observed result: qmd failed before returning context because the sqlite-vec
extension was unavailable and the database file could not be opened.

This packet therefore uses only general public-safe mechanism knowledge about
Marxophone-style fretless zither instruments and keeps all string tuning,
course layout, action geometry, spring behavior, CAD, DXF, and fabrication
details as pending-measurement work.

| session_id | timestamp_utc | tool | input_authority | outputs | role | authority_result | review_status | notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| r7-marxophone-l1-2026-05-30 | 2026-05-30 | qmd CLI; file authoring only | Round 7 handoff; general Marxophone mechanism brief | README.md; design.md; bom.csv; visual-output-register.csv; cad/mcp-session-log.md; decision-record.md | provenance_stub | concept_only / pending_measurement | self_checked | QMD query timed out before returning usable context; no CAD, DXF, measurement, tuning, action, or acoustic authority was created. |
| r7-marxophone-l2-2026-05-30 | 2026-05-30 | qmd CLI; local text edit | Existing L1 packet files only | README.md; design.md; bom.csv; cut-list.csv; visual-output-register.csv; cad/mcp-session-log.md; decision-record.md | l2_packet_uplift | concept_only / pending_measurement | self_checked | QMD search failed with sqlite-vec unavailable; L2 review structure added without CAD, DXF, string tuning, course counts, spring rates, action dimensions, or acoustic values. |
| r8-marxophone-wolfram-2026-05-30 | 2026-05-30 | local text edit | Round 8 Wolfram author contract plus existing repo design notes | marxophone-starter.wl; wolfram/marxophone-wolfram-model.wl | wolfram_source_authoring | reference_only | self_checked | No MCP, Desktop, or Cloud Wolfram session was run; source was authored by hand. All physical numeric inputs are estimate placeholders pending measurement, not fabrication authority. |
| fable-v5-refresh-2026-07-01 | 2026-07-01 | claude-code (Fable 5) + OpenSCAD CLI | design.md concept + L2 subsystem plan | cad/marxophone.scad | cad_authoring | pending_measurement | self_checked | Generic review-envelope master (fretless zither soundbox + string band + schematic spring-hammer action). Traces to NO measured design table; all values prototype_assumption; no spring force model. OpenSCAD render check: pass (openscad -o STL, exit 0). Not fabrication authority. |
| fable-v5-refresh-2026-07-01 | 2026-07-01 | claude-code (Fable 5) | design.md; bom.csv; cut-list.csv | sourcing.csv; validation.csv; risks.md; drawing-brief.md | packet_refresh | pending_measurement | self_checked | Scaffolded missing baseline files honestly (all concept_only / pending_measurement, targets TBD). Added evolution/ Stage 0 intake. No dimensions invented. |
