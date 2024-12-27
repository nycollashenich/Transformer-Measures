module Conversion
  
  FACTORS_LENGTH = {
    "inch" => 0.0254,         # Imperial
    "foot" => 0.3048,
    "yard" => 0.9144,
    "mile" => 1609.34,
    "millimeter" => 0.001,    # Metric
    "centimeter" => 0.01,
    "meter" => 1,
    "kilometer" => 1000
  }

  FACTORS_WEIGHT = {
    "gram" => 1,              # Peso (base em gramas)
    "kilogram" => 1000,
    "ton" => 1_000_000,
    "pound" => 453.59237,
    "ounce" => 28.3495
  }

end
