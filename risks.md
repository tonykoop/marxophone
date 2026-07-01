<!-- SPDX-License-Identifier: CC-BY-4.0 -->

# Marxophone Risks

Scaffolded 2026-07-01 during V5 refresh. This is an L2 concept packet with no
measured dimensions; risks below are qualitative and drive the coupon plan in
`design.md`.

## Action / mechanism

- **Spring-hammer rebound inconsistency:** tremolo density and control depend on
  spring rate, arm mass/stiffness, pivot, and tip material — all unmeasured.
  Requires one-course action coupon trials before any action layout.
- **Mechanism rattle vs. useful tremolo:** unwanted noise may dominate; damping
  is an optional branch (design.md, bom.csv MUTE-001) decided after coupon tests.
- **String wear from repeated hammer contact:** tip hardness/shape must be
  measured against string wear (bom.csv TIP-001).

## Structural / stringing

- **Soundboard/bridge load:** course count, gauges, and tension are unspecified;
  soundboard bracing and bridge coupling need coupon response before body build.
- **Fretless tuning stability:** no scale length or pitch map is claimed; string
  bed behavior must be tested (design.md Measurement Plan).

## Process / safety

- **Tensioned-string + spring trials:** require a safety checklist before load
  (bom.csv SAFETY-001); final controls depend on the selected fixture.
- **Premature promotion:** do not promote any value to CAD/DXF/tuning authority
  before measured and reviewed evidence exists (design.md Authority Boundary).

## Authority

All rows remain concept_only / pending_measurement. This file is not a validated
FMEA; it is a planning risk register for the L2 review stage.
