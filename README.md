<!-- SPDX-License-Identifier: CC-BY-4.0 -->

# Marxophone

Status: L1 V5 concept / pending-measurement build packet. This repo describes
a fretless zither concept with spring-mounted hammer arms and tremolo behavior,
but it contains no fabricated CAD geometry, DXF coordinates, measured string
tuning, acoustic values, action dimensions, or shop-ready specifications.

## Thesis

A Marxophone-style instrument combines a fretless zither body with spring
hammer arms that bounce against selected string courses when keys or levers are
pressed. The bouncing arm creates a repeating attack that can suggest mandolin
tremolo while the unstopped strings keep the soundboard and tuning problem in
the zither family.

This packet treats the instrument as a low-stakes design study. The goal is to
map the mechanism, authority boundaries, and first measurement questions before
any CAD, DXF, tuning chart, or fabrication template exists.

## Intended Mechanics

- Body: zither-like string bed and resonant soundboard.
- Stringing: fretless string courses selected only after measured scale,
  tension, bridge, and material tests.
- Action: spring-mounted hammer arms that rebound on the strings when actuated.
- Tremolo: repeated hammer contact from spring/arm dynamics, not motorized
  tremolo.
- Playing interface: keys, tabs, or levers that press hammer arms into motion.
- Authority: all string gauges, courses, pitch targets, action travel, spring
  rates, arm masses, and bridge geometry remain pending measurement.

## Packet Map

- `design.md` - mechanism model and parametric intent.
- `bom.csv` - estimated subsystem list.
- `visual-output-register.csv` - V5 authority register.
- `cad/mcp-session-log.md` - QMD and no-MCP/no-CAD provenance.
- `decision-record.md` - design choices, unknowns, and promotion gates.

## Status Boundary

This is not a fabrication-ready instrument. Before fabrication authority can be
claimed, the design needs measured string response, soundboard tests, hammer
arm prototypes, spring rebound data, playable action trials, and reviewed CAD,
DXF, or measured templates.
