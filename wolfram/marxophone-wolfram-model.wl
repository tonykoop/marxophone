(* Marxophone parametric string and spring-hammer model.
   All physical numeric inputs are estimates pending measurement and are not fabrication authority. *)

ClearAll["Global`*"];

packetMetadata = <|
   "Instrument" -> "Marxophone",
   "Packet" -> "Round 8 Wolfram build-packet model",
   "ModelName" -> "Fretless zither string and damped spring-hammer explorer",
   "Authority" -> "reference_only; estimate placeholders only"
   |>;

stringScaleLengthEstimate = 0.48; (* estimate - pending measurement, not fabrication authority *)
stringTensionEstimate = 38.; (* estimate - pending measurement, not fabrication authority *)
linearDensityEstimate = 0.00065; (* estimate - pending measurement, not fabrication authority *)
hammerEffectiveMassEstimate = 0.006; (* estimate - pending measurement, not fabrication authority *)
springRateEstimate = 45.; (* estimate - pending measurement, not fabrication authority *)
springDampingCoefficientEstimate = 0.08; (* estimate - pending measurement, not fabrication authority *)
hammerStrokeEstimate = 0.012; (* estimate - pending measurement, not fabrication authority *)
hammerTipContactTimeEstimate = 0.006; (* estimate - pending measurement, not fabrication authority *)
courseCountEstimate = 12; (* estimate - pending measurement, not fabrication authority *)
soundboardCouplingCoefficientEstimate = 0.25; (* estimate - pending measurement, not fabrication authority *)

stringFrequency[length_, tension_, linearDensity_] :=
  (1/(2 length)) Sqrt[tension/linearDensity];

hammerNaturalFrequency[springRate_, mass_] :=
  (1/(2 Pi)) Sqrt[springRate/mass];

hammerDampingRatio[dampingCoefficient_, springRate_, mass_] :=
  dampingCoefficient/(2 Sqrt[springRate mass]);

hammerEnergyProxy[springRate_, stroke_] :=
  (1/2) springRate stroke^2;

contactDutyRatio[contactTime_, reboundFrequency_] :=
  contactTime reboundFrequency;

marxophoneModel[length_, tension_, linearDensity_, hammerMass_, springRate_,
   dampingCoefficient_, stroke_, contactTime_, courseCount_,
   couplingCoefficient_] :=
  Module[
   {fundamentalFrequency, harmonicTable, hammerFrequency, dampingRatio,
    attackEnergyProxy, dutyRatio, dampedFrequency, responseTable},
   fundamentalFrequency = stringFrequency[length, tension, linearDensity];
   harmonicTable =
    Table[{mode, mode fundamentalFrequency}, {mode, 1, 8}];
   hammerFrequency = hammerNaturalFrequency[springRate, hammerMass];
   dampingRatio = hammerDampingRatio[dampingCoefficient, springRate, hammerMass];
   attackEnergyProxy = hammerEnergyProxy[springRate, stroke];
   dutyRatio = contactDutyRatio[contactTime, hammerFrequency];
   dampedFrequency =
    hammerFrequency Sqrt[Max[0, 1 - dampingRatio^2]];
   responseTable =
    Table[
     {time,
      stroke Exp[-dampingRatio 2 Pi hammerFrequency time] Cos[
        2 Pi dampedFrequency time]},
     {time, 0, 5/hammerFrequency, 1/(20 hammerFrequency)}
     ];
   <|
    "FundamentalHz" -> fundamentalFrequency,
    "StringHarmonicsHz" -> harmonicTable,
    "HammerReboundHz" -> hammerFrequency,
    "HammerDampingRatio" -> dampingRatio,
    "HammerEnergyProxyJ" -> attackEnergyProxy,
    "ContactDutyRatio" -> dutyRatio,
    "CourseCount" -> courseCount,
    "SoundboardCouplingCoefficient" -> couplingCoefficient,
    "HammerResponseM" -> responseTable
    |>
   ];

marxophoneExplorer =
  Manipulate[
   Module[
    {model, harmonics, hammerPlot},
    model =
     marxophoneModel[
      stringScaleLengthEstimate scaleLengthFactor,
      stringTensionEstimate tensionFactor,
      linearDensityEstimate densityFactor,
      hammerEffectiveMassEstimate hammerMassFactor,
      springRateEstimate springRateFactor,
      springDampingCoefficientEstimate dampingFactor,
      hammerStrokeEstimate strokeFactor,
      hammerTipContactTimeEstimate contactTimeFactor,
      Round[courseCountEstimate courseCountFactor],
      soundboardCouplingCoefficientEstimate couplingFactor
      ];
    harmonics =
     Prepend[
      ({#[[1]], NumberForm[#[[2]], {8, 2}]} & /@
        model["StringHarmonicsHz"]),
      {"mode", "frequency Hz"}
      ];
    hammerPlot =
     ListLinePlot[
      model["HammerResponseM"],
      Frame -> True,
      FrameLabel -> {"time s", "hammer displacement m"},
      PlotLabel -> "Damped spring-hammer response from estimate placeholders"
      ];
    Column[
     {
      packetMetadata,
      Grid[
       {
        {"fundamental Hz", NumberForm[model["FundamentalHz"], {8, 2}]},
        {"hammer rebound Hz", NumberForm[model["HammerReboundHz"], {8, 2}]},
        {"hammer damping ratio",
         NumberForm[model["HammerDampingRatio"], {8, 3}]},
        {"hammer energy proxy J",
         NumberForm[model["HammerEnergyProxyJ"], {8, 5}]},
        {"tip contact duty ratio",
         NumberForm[model["ContactDutyRatio"], {8, 3}]},
        {"course count placeholder", model["CourseCount"]},
        {"soundboard coupling coefficient",
         NumberForm[model["SoundboardCouplingCoefficient"], {8, 3}]}
        },
       Frame -> All
       ],
      Grid[harmonics, Frame -> All],
      hammerPlot
      }
     ]
    ],
   {{scaleLengthFactor, 1, "scale length factor"}, 0.5, 1.5,
    Appearance -> "Labeled"},
   {{tensionFactor, 1, "string tension factor"}, 0.5, 2.0,
    Appearance -> "Labeled"},
   {{densityFactor, 1, "linear density factor"}, 0.5, 2.0,
    Appearance -> "Labeled"},
   {{hammerMassFactor, 1, "hammer mass factor"}, 0.25, 2.0,
    Appearance -> "Labeled"},
   {{springRateFactor, 1, "spring rate factor"}, 0.25, 3.0,
    Appearance -> "Labeled"},
   {{dampingFactor, 1, "spring damping factor"}, 0.25, 3.0,
    Appearance -> "Labeled"},
   {{strokeFactor, 1, "hammer stroke factor"}, 0.25, 2.0,
    Appearance -> "Labeled"},
   {{contactTimeFactor, 1, "tip contact time factor"}, 0.25, 2.0,
    Appearance -> "Labeled"},
   {{courseCountFactor, 1, "course count factor"}, 0.5, 2.0,
    Appearance -> "Labeled"},
   {{couplingFactor, 1, "soundboard coupling factor"}, 0.25, 2.0,
    Appearance -> "Labeled"},
   ControlPlacement -> Left
   ];

marxophoneExplorer
