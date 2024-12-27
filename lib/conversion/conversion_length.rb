require_relative './conversion_base.rb'

class ConversionLength

  include Conversion # base_convertion.rb

    def initialize(value, origin_unit, destination_unit)
      @value = value
      @origin_unit = origin_unit
      @destination_unit = destination_unit
    end

    def convert
      if FACTORS_LENGTH.key?(@origin_unit) && FACTORS_LENGTH.key?(@destination_unit)
        convert_length
      else
        raise 'Unidades incompatíveis'
      end 
    end
    
    private
    def convert_length
      origin_factor = FACTORS_LENGTH[@origin_unit]
      destination_factor = FACTORS_LENGTH[@destination_unit]
      value_in_meters = @value * origin_factor
      value_in_meters / destination_factor
    end

end
