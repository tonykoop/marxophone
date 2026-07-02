// Marxophone — parametric master (fretless zither soundbox + string band +
// spring-hammer envelope).
//
// Authority: pending_measurement. NOT fabrication authority.
//
// HONESTY NOTE: this packet has NO measured design table. design.md, bom.csv,
// and cut-list.csv keep EVERY build-critical value (scale length, course count,
// string gauges, pitch map, bridge geometry, hammer arm mass/stiffness, spring
// rate, key travel) at concept_only / pending_measurement. Therefore every
// dimension below is a GENERIC REVIEW ENVELOPE (prototype_assumption), not a
// traced authority value. Its only job is to give reviewers a massing model of
// a fretless zither string bed with a spring-hammer action band. Do not cut,
// drill, tune, or order from these numbers (design.md "Authority Boundary").
//
// Every value here is a prototype_assumption unless design.md later documents
// a measured value; hammer spring specifics (rate, preload, pivot) are NOT
// modeled as forces — only a schematic arm/spring envelope is shown.
//
// Units: inches. All values prototype_assumption / envelope-only.

/* [Soundbox envelope — generic zither, prototype_assumption] */
body_length_in   = 26.0;   // prototype_assumption (generic zither footprint)
body_width_near_in = 12.0; // prototype_assumption (player near edge, wide)
body_width_far_in  = 8.0;  // prototype_assumption (far edge, tapered)
body_depth_in    = 2.5;    // prototype_assumption
soundboard_thk_in = 0.16;  // prototype_assumption
back_thk_in      = 0.16;   // prototype_assumption
rim_thk_in       = 0.5;    // prototype_assumption
soundhole_dia_in = 3.0;    // prototype_assumption

/* [String band envelope — count/lengths NOT specified, envelope-only] */
course_count     = 12;     // prototype_assumption (design.md: course count TBD)
strings_per_course = 2;    // prototype_assumption (typical zither pairing)
band_margin_in   = 2.0;    // prototype_assumption (band inset from body edges)
string_z_in      = 0.55;   // prototype_assumption (string height over board)
bridge_offset_in = 3.0;    // prototype_assumption (bridge inset from near edge)
bridge_height_in = 0.6;    // prototype_assumption

/* [Spring-hammer action band — schematic envelope only, NO force model] */
hammer_count     = 12;     // prototype_assumption (one arm per modeled course)
arm_length_in    = 4.0;    // prototype_assumption (schematic only)
arm_width_in     = 0.35;   // prototype_assumption
arm_thk_in       = 0.08;   // prototype_assumption
pivot_row_offset_in = 1.5; // prototype_assumption (pivot rail inset from far edge)
tip_dia_in       = 0.30;   // prototype_assumption

$fn = 40;

// ---------------------------------------------------------------------------
// Derived geometry (formulas, not baked values)
// ---------------------------------------------------------------------------
half_near = body_width_near_in / 2;
half_far  = body_width_far_in / 2;
band_len  = body_length_in - 2 * band_margin_in;
band_wide = body_width_near_in - 2 * band_margin_in;
// String lateral spacing derived from course count across the band.
function course_x(i) =
  -band_wide/2 + band_wide * ((course_count <= 1) ? 0.5 : i/(course_count-1));

function body_pts() = [
  [-half_near, 0], [half_near, 0],
  [half_far, body_length_in], [-half_far, body_length_in]
];

// ---------------------------------------------------------------------------
// Component modules
// ---------------------------------------------------------------------------
module soundboard() {
  color("BurlyWood")
  difference() {
    linear_extrude(height = soundboard_thk_in) polygon(body_pts());
    translate([0, body_length_in * 0.42, -0.01])
      cylinder(h = soundboard_thk_in + 0.02, d = soundhole_dia_in);
  }
}

module rim_and_back() {
  color("Sienna")
  translate([0, 0, -body_depth_in])
    linear_extrude(height = body_depth_in)
      difference() {
        polygon(body_pts());
        offset(r = -rim_thk_in) polygon(body_pts());
      }
  color("Tan")
  translate([0, 0, -body_depth_in])
    linear_extrude(height = back_thk_in) polygon(body_pts());
}

module bridge() {
  color("DarkRed")
  translate([-band_wide/2, bridge_offset_in, soundboard_thk_in])
    cube([band_wide, 0.4, bridge_height_in]);
}

// String band: parallel courses over the soundboard (envelope, not tuned).
module string_band() {
  for (i = [0 : course_count - 1]) {
    x = course_x(i);
    for (s = [0 : strings_per_course - 1]) {
      dx = (s - (strings_per_course - 1) / 2) * 0.12;  // pair spacing (assumption)
      color([0.85, 0.85, 0.9])
      translate([x + dx, band_margin_in, soundboard_thk_in + string_z_in])
        rotate([-90, 0, 0])
          cylinder(h = band_len, d = 0.03);
    }
  }
}

// Spring-hammer action band: schematic arm + tip + spring coil per course.
// NO spring force / rate is modeled — envelope geometry only.
module hammer_action() {
  pivot_y = body_length_in - pivot_row_offset_in;
  for (i = [0 : hammer_count - 1]) {
    x = course_x(i);
    // arm reaching from pivot rail toward the string band
    color("Silver")
    translate([x, pivot_y, soundboard_thk_in + string_z_in + 0.5])
      rotate([90, 0, 0])
        cube([arm_width_in, arm_thk_in, arm_length_in], center = false);
    // schematic hammer tip at the string end of the arm
    color("DimGray")
    translate([x + arm_width_in/2, pivot_y - arm_length_in,
               soundboard_thk_in + string_z_in + 0.5])
      sphere(d = tip_dia_in);
    // schematic return-spring coil at the pivot (envelope only, no rate)
    color("Gold")
    translate([x + arm_width_in/2, pivot_y, soundboard_thk_in + string_z_in + 0.5])
      rotate([90, 0, 0])
        cylinder(h = 0.4, d = 0.25);
  }
  // pivot rail
  color("Gray")
  translate([-band_wide/2, pivot_y, soundboard_thk_in + string_z_in + 0.4])
    cube([band_wide, 0.3, 0.3]);
}

// ---------------------------------------------------------------------------
// Top-level assembly
// ---------------------------------------------------------------------------
module marxophone() {
  soundboard();
  rim_and_back();
  bridge();
  string_band();
  hammer_action();
}

marxophone();
echo(course_count = course_count, strings_per_course = strings_per_course,
     note = "envelope-only; no measured design-table authority");
