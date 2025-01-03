module LengthConversion
    FACTORS = {
    "millimeter" => 0.001,
    "centimeter" => 0.01,
    "meter" => 1,
    "kilometer" => 1000,
    "inch" => 0.0254,
    "foot" => 0.3048,
    "yard" => 0.9144,
    "mile" => 1609.34
  }

  def self.valid_units
    ["meter", "kilometer", "centimeter", "millimeter", "inch", "foot", "yard", "mile"]
  end
  

  def self.convert(value, origin_unit, destination_unit)
    value_in_meters = value * FACTORS[origin_unit]
    value_in_meters / FACTORS[destination_unit]
  end

end
