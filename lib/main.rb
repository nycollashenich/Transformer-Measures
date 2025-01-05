# frozen_string_literal: true

require './conversion/conversion_area'
require './conversion/conversion_weight'
require './conversion/conversion_length'

class UniversalConversion
  CONVERTERS = {
    'length' => LengthConversion,
    'weight' => WeightConversion
  }.freeze

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
      @available_units = CONVERTERS[@category].valid_units
      puts "Medidas disponíveis para #{@category}: #{@available_units.join(', ')}"
    else
      puts "Categoria inválida! As opções disponíveis são: #{CONVERTERS.keys.join(', ')}"
    end
  end

  def welcome
    attempts = 0
    max_attempts = 3

    puts 'Welcome!'

    begin
      puts 'Informe um valor inicial: '
      @value = gets.chomp
      raise 'Valor inválido, tente novamente' unless valid_number(@value)

      @value = @value.to_f

      puts "Agora, informe a categoria #{CONVERTERS.keys.join(', ')}: "
      @category = gets.chomp.downcase
      unless valid_category(@category)
        raise "Categoria inválida, tente alguma dessas => #{CONVERTERS.keys.join(', ')}."
      end

      units_available

      puts 'Informe a medida de origem: '
      @origin_unit = gets.chomp.downcase
      unless @available_units.include?(@origin_unit)
        raise "Unidade de origem inválida! Escolha entre: #{@available_units.join(', ')}."
      end

      puts 'Informe a medida de destino: '
      @destination_unit = gets.chomp.downcase
      unless @available_units.include?(@destination_unit)
        raise "Unidade de destino inválida! Escolha entre: #{@available_units.join(', ')}."
      end

      process_conversion(@category)
    rescue StandardError => e
      puts "Erro: #{e.message}"
      attempts += 1
      retry if attempts < max_attempts
      puts 'Número máximo de tentativas alcançado. Encerrando...'
    end
  end

  def process_conversion(category)
    convert = CONVERTERS[category]

    if valid_conversion?
      result = convert.convert(@value, @origin_unit, @destination_unit)
      puts "Resultado: #{@value} #{@origin_unit} é igual a #{result} #{@destination_unit}"
    else
      puts 'Erro ao processar a conversão! Verifique as unidades e tente novamente.'
    end
  end

  def valid_conversion?
    convert = CONVERTERS[@category]
    convert.valid_units.include?(@origin_unit) && convert.valid_units.include?(@destination_unit)
  end
end

teste = UniversalConversion.new
teste.welcome
