# require_relative '../lib/conversion/conversion_base.rb'
# require_relative '../lib/conversion/conversion_length.rb'
# require_relative '../lib/conversion/conversion_weight.rb'

# class Main
#   attr_reader :value, :origin_unit, :destination_unit

#   SYSTEMS = {
#     length: %w[inch mile millimeter meter], # %w = cria arrays
#   }
  
#   def initialize(value=nil, origin_unit=nil, destination_unit=nil)
#     @value = value
#     @origin_unit = origin_unit
#     @destination_unit = destination_unit
#   end

#   def welcome
#     p 'Bem vindo ao Convertedor de medidas!'
    
#     puts 'Digite o valor para ser convertido: '
#     value = gets.chomp.to_f

#     puts 'Digite a unidade de origem: '
#     origin_unit = gets.chomp.downcase 

#     puts 'Digite a unidade de destino: '
#     destination_unit = gets.chomp.downcase

#     system_meansure

#   end

#   def system_meansure
#     system = determination_system(origin_unit)

#     if system.nil?
#       puts "Erro: Unidade de origem não reconhecida: #{origin_unit}"
#       return 
#     end

#     unless SYSTEMS[system].include?(destination_unit)
#       p "Erro: Unidade de destino não pertence ao mesmo sistema de origem."
#       return
#     end

#     result = case system
#               when :weight
#                 WeightConversion.convert(value, origin_unit, destination_unit)
#               when :length
#                 LengthConversion.convert(value, origin_unit, destination_unit)
#               when :area
#                 AreaConversion.convert(value, origin_unit, destination_unit)
#               else
#                 "Erro: Sistema não suportado."
#               end

#     p "Resultado: #{result} #{destination_unit}"
#   end

#   private

#   def determination_system(unit)
#     SYSTEMS.each do |system, units|
#       return system if units.include?(unit)
#     end
#     nil
#   end
# end

# teste = Main.new
# teste.welcome
