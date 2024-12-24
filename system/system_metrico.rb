require_relative 'C:/transformer_measures/universal_convert/unit_to_meters.rb'

class MetricoMeasure
attr_reader :value, :unit

  def initialize(value, init)
    @value = value
    @init = init.downcase
  end

  def to_meters
    Convert.unit_to_meters(@value, @unit)
  end

end

meters = Convert.unit_to_meters(5, 'kilometer')
p "#{meters}"