module WeightConversion
  
  VALID_UNITS = %w[gr kg ton pound ounce]
  
  FACTORS = {
    "gram" => 1,              
    "kilogram" => 1000,
    "ton" => 1_000_000,
    "pound" => 453.59237,
    "ounce" => 28.3495
  }

  def self.valid_units
    ["gram", "kilogram", "ton", "pound", "ounce"]
  end
  
  def self.convert(value, origin_unit, destination_unit)
    value_in_meters = value * FACTORS[origin_unit]
    value_in_meters / FACTORS[destination_unit] 
  end
end



