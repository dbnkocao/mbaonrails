require './settings'

settings = Settings.new

puts "Definindo configurações dinamicamente"
settings.add(:timeout, 30)
settings.add(:mode, "production")
puts "*" * 100

puts "Acessando configurações via método"
puts settings.timeout # => 30
puts settings.mode # => "production"
puts "*" * 100

puts "Tentando acessar configuração inexistente"
puts settings.retry # => "Configuração 'retry' não existe."
puts "*" * 100

puts "Checando se um método está disponível"
puts settings.respond_to?(:timeout) # => true
puts settings.respond_to?(:retry) # => false

puts "*" * 100

puts "### Objetivos Extras ###"
puts "1. Suporte a aliases"
settings.add(:timeout, 30, aliass: :espera)
puts settings.timeout # => 30
puts settings.espera # => 30

puts "*" * 100

puts "2. Configuração somente leitura"
settings.add(:api_key, "SECRET", readonly: true)
settings.api_key = "HACKED" # => Erro: configuração

puts "*" * 100

puts "3. Listagem de configurações"
# Adicione um método all que retorna um hash com todas as
# configurações definidas:
puts settings.all # => { timeout: 30, mode: "production", api_key: "SECRET" }

puts "*" * 100

puts "4. Integração com method_missing para setters"
settings.timeout = 60
puts settings.timeout # => 60