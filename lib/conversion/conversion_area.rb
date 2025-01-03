module AreaConversion
  
    FACTORS = {
    "square_centimeter" => 0.0001,
    "square_meter" => 1,
    "square_kilometer" => 1_000_000,
    "square_foot" => 0.092903,
    "acre" => 4046.86
  }

  def self.convert(value, origin_unit, destination_unit)
    value_in_meters = value * FACTORS[origin_unit]
    value_in_meters / FACTORS[destination_unit]
  end
end

