class ConsoleGuide
  def self.display
    puts <<-TEXT
################################################################
#                                                              #
#           Script para pesquisar texto em arquivos            #
#                                                              #
#    1 - Digitar o nome do arquivo                             #
#    2 - Digitar o termo de pesquisa                           #
#    3 - Aguardar a conclusão da pesquisa                      #
################################################################
TEXT
  end

  def self.step1
    puts "1 - Digite o nome do arquivo de texto que deseja pesquisar (ou 'sair' para sair):"
  end

  def self.step2
    puts "2 - Digite o termo de pesquisa (ou 'sair' para sair):"
  end

  def self.step3
    puts "3 - Aguardando a conclusão da pesquisa..."
  end

  def self.result(search_term, file_path, matched_count)
    puts <<-TEXT
#################################################################
#  Pesquisa concluída com sucesso!                              #
#  Termo pesquisado: #{search_term}                             #
#  Arquivo: #{file_path}                                        #
#  Resultados encontrados: #{matched_count}                     #
#   - Para imprimir os resultados, digite 'imprimir'            #
#   - Para uma nova pesquisa, digite 'nova'                     #
#   - Para sair, pressione ENTER                                #
#################################################################
Opção:
    TEXT
  end

end