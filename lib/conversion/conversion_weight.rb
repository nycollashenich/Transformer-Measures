module WeightConversion
  
  VALID_UNITS = %w[gr kg ton pound ounce]
  
  def self.valid_units
  VALID_UNITS
  end
  
  FACTORS = {
    "gram" => 1,              
    "kilogram" => 1000,
    "ton" => 1_000_000,
    "pound" => 453.59237,
    "ounce" => 28.3495
  }

  
  
  def self.convert(value, origin_unit, destination_unit)
    value_in_meters = value * FACTORS[origin_unit]
    value_in_meters / FACTORS[destination_unit] 
  end
end



