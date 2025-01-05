# frozen_string_literal: true

module LengthConversion
  VALID_UNITS = %w[mm cm m km inch ft yard mile].freeze

  def self.valid_units
    VALID_UNITS
  end

  FACTORS = {
    'mm' => 0.001,
    'cm' => 0.01,
    'm' => 1,
    'km' => 1000,
    'inch' => 0.0254,
    'ft' => 0.3048,
    'yard' => 0.9144,
    'mile' => 1609.34
  }.freeze


  def self.convert(value, origin_unit, destination_unit)
    value_in_meters = value * FACTORS[origin_unit]
    value_in_meters / FACTORS[destination_unit]
  end
end
