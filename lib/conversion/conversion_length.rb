module LengthConversion
  
  VALID_UNITS = %w[mm cm m km inch ft yard mile]

  def self.valid_units
    VALID_UNITS
  end
  
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
  

  def self.convert(value, origin_unit, destination_unit)
    value_in_meters = value * FACTORS[origin_unit]
    value_in_meters / FACTORS[destination_unit]
  end

end
