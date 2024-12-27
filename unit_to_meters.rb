class Conversion

  CONVERSION_FACTORS = {
  
  # Imperial System
  "inch" => 0.0254,
  "foot" => 0.3048,
  "yard" => 0.9144,
  "mile" => 1609.34,


  # Metric System
  "millimeter" => 0.001,
  "centimeter" => 0.01,
  "meter" => 1,
  "kilometer" => 1000,

  # Area System
  "square_centimeter" => 0.0001,
  "square_millimeter" => 0.000001,
  "hectare" => 10000,
  "square_kilometer" => 1_000_000,
  "square_foot" => 0.092903,
  "square_yard" => 0.836127,
  "acre" => 4046.86,


}

attr_reader :value, :origin_unit, :destination_unit,  :origin_system, :destination_system

def initialize(value, origin_unit, destination_unit) # origin_system, destination_system
  @value = value
  @origin_unit = origin_unit
  @destination_unit = destination_unit
  @origin_system = origin_system
  @destination_system = destination_system
  
  unless CONVERSION_FACTORS.key?(@origin_unit) && CONVERSION_FACTORS.key?(@destination_unit)
    raise "Unidade não suportada: #{origin_unit} ou #{destination_unit}"
  end
end


def convert_to_meter
  origin_factor = CONVERSION_FACTORS[@origin_unit]
  value_in_meter = value * origin_factor
  value_in_meter
end

def convert_to_destination
  value_in_meter = convert_to_meter
  destination_factor = CONVERSION_FACTORS[@destination_unit]
  value_in_meter * destination_factor
end


end


converter_teste = Conversion.new(1, 'inch', 'acre')
p converter_teste.convert_to_destination


