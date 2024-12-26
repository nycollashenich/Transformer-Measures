require_relative '../universal_convert/unit_to_meters.rb'

class AreaMeasure
attr_reader :value, :unit  
    def initialize(value, unit)
        @value = value
        @unit = unit
    end

    def to_meters
      Convert.unit_to_meters(@value, @unit)
    end
    end

meter = Convert.unit_to_meters(0.5, 'acre')
p "#{meter}"