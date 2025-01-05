require './conversion/conversion_area'
require './conversion/conversion_weight'
require './conversion/conversion_length'

require 'colorize'

class UniversalConversion
  CONVERTERS = {
    'length' => LengthConversion,
    'weight' => WeightConversion
  }

  def initialize(value = nil, origin_unit = nil, destination_unit = nil)
    @value = value
    @origin_unit = origin_unit
    @destination_unit = destination_unit
  end

  def valid_number(value)
    Float(value)
  rescue StandardError
    false
  end

  def valid_category(category)
    CONVERTERS.key?(category)
  end

  def units_available
    if CONVERTERS.key?(@category)
      available_units = CONVERTERS[@category].valid_units
      puts "Medidas disponíveis para #{@category}: #{available_units.join(', ')}".colorize(:green)
    else
      puts "Categoria inválida! As opções disponíveis são: #{CONVERTERS.keys.join(', ')}"
    end
  end

  def welcome # dados capitados / tratados
    attempts = 0
    max_attempts = 3

    puts 'Welcome!'.colorize(:yellow)

    begin
      puts 'Informe um valor inicial: '.colorize(:blue)
      @value = gets.chomp
      unless valid_number(@value) # unless =  se a condição for falsa
        raise 'Valor inválido, tente novamente'.colorize(:red)
      end

      @value = @value.to_f

      puts "Agora, informe a categoria #{CONVERTERS.keys.join(', ')}: ".colorize(:blue)
      @category = gets.chomp.downcase
      unless valid_category(@category)
        raise "Categoria inválida, tente alguma dessas => #{CONVERTERS.keys.join(', ')}.".colorize(:red)
      end

      units_available

      puts 'Informe a medida de origem: '.colorize(:green)
      @origin_unit = gets.chomp.downcase

      puts 'Informe a medida de destino: '.colorize(:green)
      @destination_unit = gets.chomp.downcase

      process_conversion(@category)
    rescue StandardError => e
      puts "Erro: #{e.message}"
      attempts += 1
      retry if attempts < max_attempts
      puts 'Número máximo de tentativas alcançado. Encerrando...'.colorize(:red)
    end
  end

  def process_conversion(category)
    convert = CONVERTERS[category]

    if valid_conversion?
      result = convert.convert(@value, @origin_unit, @destination_unit)
      p "Resultado: #{@value} #{@origin_unit} é igual a #{result} #{@destination_unit}".colorize(:purple)
    else
      p "Unidade inválida! Escolha entre: #{convert.valid_units.join(', ')}.".colorize(:red)
    end
  end

  def valid_conversion?
    convert = CONVERTERS[@category]
    convert.valid_units.include?(@origin_unit) && convert.valid_units.include?(@destination_unit)
  end
end



teste = UniversalConversion.new(10)
teste.welcome
