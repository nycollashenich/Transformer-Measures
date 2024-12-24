require_relative 'C:/transformer_measures/teste/unit_to_meters.rb'

class ImperialMeasure
attr_reader :value, :unit
def initialize(value, unit)
    @value = value
    @unit = unit.downcase
end

def to_meters
    Convert.unit_to_meters(@value, @unit)
end

end

meters = Convert.unit_to_meters(10, 'millimeter')   
p "#{meters}"