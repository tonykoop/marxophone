# Design Intent — marxophone rev A

- Master CAD: `cad/marxophone.scad` (sha256: cee9a26a516202018f6aea147443089a296df63fb85bb908431fdcf59429839a) — a GENERIC REVIEW ENVELOPE, controlled loosely by `design.md` concept (sha256: 38173ea6544e37c11e1e61ac09d438152b1973db9ad6412eafadf92e9f8edbc8). No measured design table exists.
- Function: Marxophone-style fretless zither. A resonant zither soundbox and fretless string courses are the sound source; spring-mounted metal hammer arms rebound on selected courses when keys/tabs/levers are pressed, producing a mandolin-like tremolo. The hammer system is an exciter, not a fretting system — it strikes/brushes strings without defining a stopped speaking length.
- Environment: indoor instrument. String load + repeated hammer contact act on the soundboard, bridge, and hammer/spring action — all behaviors unmeasured.
- Target qty: 1 (L2 concept / coupon stage). Deadline: TBD. Budget/unit ceiling: TBD.

## Critical dimensions (carry tolerances)

NONE are established. Every build-critical value is intentionally unspecified
pending bench evidence. The table below lists WHAT must be measured, not values.

| Feature | Nominal | Tolerance | Why critical | Source |
| --- | --- | --- | --- | --- |
| Scale length / course count / pitch map | TBD | measured after string tests | intonation / range | design.md (pending_measurement) |
| String gauges / material / tension | TBD | measured / supplier data | soundboard load + tone | bom.csv STRING-001 (pending_measurement) |
| Bridge geometry / coupling | TBD | bridge coupon | load path + tone | bom.csv BRIDGE-001 (pending_measurement) |
| Hammer arm mass / stiffness / pivot | TBD | action coupon trials | tremolo control | bom.csv HAMMER-001 (pending_measurement) |
| Hammer tip material / shape | TBD | tone vs. string wear | attack + wear | bom.csv TIP-001 (pending_measurement) |
| Spring rate / preload / mount | TBD | rebound trials | tremolo density | bom.csv SPRING-001 (pending_measurement) |
| Key/lever travel + leverage | TBD | ergonomic trials | player feel | bom.csv KEY-001 (pending_measurement) |
| Soundboard thickness / bracing | TBD | soundboard coupon | tone + load | bom.csv BODY-001 (pending_measurement) |

## Incidental (free for DFM)

- Nothing is locked; the entire geometry is a review envelope. Cosmetic body outline and finish are incidental once real dimensions exist.

## Must-nots (DFM may never violate)

- Do not cut, drill, tune, order final strings, specify springs, or machine action parts from any envelope value — all are prototype_assumption (design.md "Authority Boundary").
- Do not conflate string-bed tuning tests with hammer-action tests (design.md L2 Review Checklist).
- Do not promote any value to CAD/DXF/tuning/fabrication authority before measured and reviewed evidence exists.
- Do not run tensioned-string + spring trials without the safety checklist (bom.csv SAFETY-001).

## Material intent

- Preferred: zither soundboard stock, fretless string set, hardwood/metal bridge, spring-steel returns, metal hammer arms with replaceable tips (bom.csv). No material selected; all estimate_concept / estimate_material_family.
- Acceptable subs: per sourcing.csv (spec-first; live prices unverified).
- Forbidden: none recorded (nothing selected yet).

## Stage status

Stage 0 intake complete 2026-07-01. Gate A (Alpha shop compile) NOT yet run. Product is an L2 concept packet; the master is a review envelope, not shippable. Coupon/action bench evidence is the gate before any promotion.
