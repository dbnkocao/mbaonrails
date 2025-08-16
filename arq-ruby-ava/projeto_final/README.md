# Fundamentos Avançados de Ruby (Projeto Final)

## Buscador de texto em arquivos .txt
Recebendo um arquivo como parâmetro o arquivo e depois um termo para ser procurado no arquivo. Como resultado retorna as linhas que contém o termo, destacando o termo pesquisado.


## Principais Arquivos
- **main.rb**: Arquivo a ser executado para começar a aplicação.
- **lib/parallel**: Módulo para processamento em paralelo
- **lib/colorize**: Módulo para imprimir texto no console com background colorido.
- **lib/find_text**: Classe que gerencia a busca.
- **lib/matched_lines**: Classe para a coleção de linhas com o termo encontrado.

## Modo de Usar

Iniciando o projeto

```
ruby main.rb
```

Escolhendo o arquivo a ser pesquisado:

```
################################################################
#                                                              #
#           Script para pesquisar texto em arquivos            #
#                                                              #
#    1 - Digitar o nome do arquivo                             #
#    2 - Digitar o termo de pesquisa                           #
#    3 - Aguardar a conclusão da pesquisa                      #
################################################################
1 - Digite o nome do arquivo de texto que deseja pesquisar:
```

Escolhendo o termo a ser pesquisado:

```
2 - Digite o termo de pesquisa:
```

Com o resultado encontrado, teremos as opções de imprimir, começar uma nova pesquisa ou sair:
```
#################################################################
#  Pesquisa concluída com sucesso!                              #
#  Termo pesquisado: Lorem                   #
#  Arquivo: example.txt                              #
#  Resultados encontrados: 11     #
#   - Para imprimir os resultados, digite 'imprimir'            #
#   - Para uma nova pesquisa, digite 'nova'                     #
#   - Para sair, pressione ENTER                                #
#################################################################
Opção:
```

Ao imprimir aparecerá as linhas com seus respectivos números e com o termo destacado


```
187-
Vestibulum gravida molestie risus id sagittis. Duis egestas convallis eros, vel tempor arcu. Aenean sit amet augue augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus a est sed lacus tempus euismod ut porttitor lacus. Ut at quam sit amet tellus sollicitudin hendrerit sed ac felis. Donec id fermentum lorem, aliquet interdum lectus. Nam tempus luctus nunc. Quisque sed sollicitudin risus, in fringilla quam. Sed vel blandit urna. Lorem ipsum dolor sit amet, consectetur adipiscing elit.

```
