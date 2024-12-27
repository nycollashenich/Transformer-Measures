require_relative './base_conversion.rb'

class ConversionWeight

  include Conversion

  def initialize(value, origin_unit, destination_unit)
    @value = value
    @origin_unit = origin_unit
    @destination_unit = destination_unit
  end

  def convert
    if FACTORS_WEIGHT.key?(@origin_unit) && FACTORS_WEIGHT.key?(@destination_unit)
      convert_weight
    else
      raise 'Unidades incompatíveis'
    end
  end

  private
  def convert_weight
    origin_factor = FACTORS_WEIGHT[@origin_unit]
    destination_factor = FACTORS_WEIGHT[@destination_unit]
    value_weight = @value * origin_factor
    value_weight / destination_factor
  end
end
