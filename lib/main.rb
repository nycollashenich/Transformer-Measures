require './conversion/conversion_area.rb'
require './conversion/conversion_weight.rb'
require './conversion/conversion_length.rb'

class UniversalConversion

  CONVERTERS = {
    'length' => LengthConversion,
    'weight' => WeightConversion,
  }

  def initialize(value=nil, origin_unit=nil, destination_unit=nil)
    @value = value
    @origin_unit = origin_unit
    @destination_unit = destination_unit
  end 

  def welcome # dados capitados / tratados
    p "Welcome!"
    
    p 'informe o seu valor inicial: '
    @value = gets.chomp.to_f

    p 'Informe a categoria (length, weight)'
    category = gets.chomp.to_s

    p 'Informe a medida de origem: '
    @origin_unit = gets.chomp.to_s.downcase

    p 'Informe a medida de destino: '
    @destination_unit = gets.chomp.downcase
  
    # verification

    if CONVERTERS.key?(category)
      process_conversion(category)
    else
      p 'Category invalid.'
    end
  end

  def process_conversion(category)
    convert = CONVERTERS[category]

    if convert && convert.valid_units.include?(@origin_unit) && convert.valid_units.include?(@destination_unit)
      result = convert.convert(@value, @origin_unit, @destination_unit)
      p "Result: #{@value} #{@origin_unit} #{@destination_unit}  /  #{result}"
    else
      p 'unidades inválidas.' 
    end
  end

end



teste = UniversalConversion.new(10)
teste.welcome