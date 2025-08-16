require './lib/find_text'

find_text = FindText.new
find_text.init_threads

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

loop do
  break if find_text.file_path == "sair" || find_text.search_term == "sair"

  sleep 0.5
  if find_text.file_path && find_text.all_thread_finished?
    puts <<-TEXT
#################################################################
#  Pesquisa concluída com sucesso!                              #
#  Termo pesquisado: #{find_text.search_term}                   #
#  Arquivo: #{find_text.file_path}                              #
#  Resultados encontrados: #{find_text.matched_lines.count}     #
#   - Para imprimir os resultados, digite 'imprimir'            #
#   - Para uma nova pesquisa, digite 'nova'                     #
#   - Para sair, pressione ENTER                                #
#################################################################
    TEXT
    puts "Opção:"
    option = gets.chomp
    if option == "imprimir"
      find_text.matched_lines.print
      next
    elsif option == "nova"
      find_text.reset_search
      next
    else
      puts "Saindo ..."
      break
    end
  end

  next if find_text.file_path && find_text.search_term

  # Lendo a
  loop do
    sleep 0.2
    break if find_text.file_path
    puts "1 - Digite o nome do arquivo de texto que deseja pesquisar:"
    file_path = gets.chomp
    if file_path == "sair"
      puts "Saindo..."
      break
    end
    if File.exist?(file_path)
      find_text.file_path = file_path
      break
    else
      puts "Arquivo não encontrado"
      next
    end
  end

  loop do
    sleep 0.2
    if find_text.search_term.nil?
      puts "2 - Digite o termo de pesquisa:"
      search_term = gets.chomp
      break if search_term == "sair"
      find_text.search_term = search_term
      find_text.search
      puts "3 - Aguardando a conclusão da pesquisa..."
      break
    end
  end
end
