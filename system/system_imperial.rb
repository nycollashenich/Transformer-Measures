require_relative 'C:/transformer_measures/universal_convert/unit_to_meters.rb'

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

meters = Convert.unit_to_meters(2, 'mile')   
p "#{meters}"