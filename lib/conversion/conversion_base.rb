module Conversion
  
  FACTORS_LENGTH = {
    # Imperial
    "inch" => 0.0254,         
    "foot" => 0.3048,
    "yard" => 0.9144,
    "mile" => 1609.34,
    # Metric
    "millimeter" => 0.001,
    "centimeter" => 0.01,
    "meter" => 1,
    "kilometer" => 1000
  }

  FACTORS_WEIGHT = {
    # Peso (base em gramas)
    "gram" => 1,              
    "kilogram" => 1000,
    "ton" => 1_000_000,
    "pound" => 453.59237,
    "ounce" => 28.3495
  }

end
