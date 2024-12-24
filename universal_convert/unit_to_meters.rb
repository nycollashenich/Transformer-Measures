class Convert

  CONVERSION_FACTORS = {
  
  # Imperial System
  "inch" => 0.0254,
  "foot" => 0.3048,
  "yard" => 0.9144,
  "mile" => 1609.34,


  # Sistema Métrico
  "millimeter" => 0.001,
  "centimeter" => 0.01,
  "meter" => 1,
  "kilometer" => 1000,

}

def self.unit_to_meters(value, unit)
  unit = unit.downcase
  factor = CONVERSION_FACTORS[unit]

  raise "Unidade não suportada. #{unit}" unless factor

  value * factor # transformation
  end
  

end

