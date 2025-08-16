require './lib/find_text'
require './lib/console_guide'
find_text = FindText.new
find_text.init_threads

ConsoleGuide.display

loop do
  break if find_text.file_path == "sair" || find_text.search_term == "sair"

  # Apresentando resultado
  sleep 0.5
  if find_text.file_path && find_text.all_thread_finished?
    ConsoleGuide.result(find_text.search_term, find_text.file_path, find_text.matched_lines.count)
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

  # Definindo path do arquivo
  loop do
    sleep 0.2
    break if find_text.file_path
    ConsoleGuide.step1
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

  # Buscando termo no arquivo
  loop do
    sleep 0.2
    if find_text.search_term.nil?
      ConsoleGuide.step2
      search_term = gets.chomp
      break if search_term == "sair"
      find_text.search_term = search_term
      find_text.search
      ConsoleGuide.step3
      break
    end
  end
end
