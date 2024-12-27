require_relative '../lib/conversion/conversion_base.rb'
require_relative '../lib/conversion/conversion_length.rb'
require_relative '../lib/conversion/conversion_weight.rb'

p 'Conversão de Comprimento'
conversao_teste = ConversionLength.new(2000, 'meter', 'kilometer')
p "#{conversao_teste.convert}"

p 'Conversão em peso'
conversao_teste1 = ConversionWeight.new(1000, 'gram', 'kilogram')
p "#{conversao_teste1.convert}"