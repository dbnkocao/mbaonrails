require './sales_report'

sales = [
{ product: "Notebook", category: "Eletrônicos", amount: 3000 },
{ product: "Celular", category: "Eletrônicos", amount: 1500 },
{ product: "Cadeira", category: "Móveis", amount: 500 },
{ product: "Mesa", category: "Móveis", amount: 1200 },
{ product: "Headphone", category: "Eletrônicos", amount: 300 },
{ product: "Armário", category: "Móveis", amount: 800 }
]
report = SalesReport.new(sales)
# Implemente a classe com as seguintes responsabilidades:
# 1. Incluir Enumerable e implementar #each para iterar
# sobre as vendas.
puts ""
puts "### Método each"
report.each do |sale|
  puts sale.inspect
end


# 2. Um método #total_by_category que retorna um hash com
# o total de vendas por categoria.
puts ""
puts "### Total por categoria"
puts report.total_by_category


# 3. Um método #top_sales(n) que retorna os n maiores
# valores de venda.
puts ""
puts "### Top N vendas"
puts report.top_sales(3)

# 4. Um método #grouped_by_category que retorna um hash
# com os produtos agrupados por categoria.
puts ""
puts "### Agrupado por categoria"
puts report.grouped_by_category

# 5. Um método #above_average_sales que retorna as vendas
# cujo valor está acima da média geral.
puts ""
puts "### Acima da média geral"
puts "Média geral: #{report.sales_average}"
puts report.above_average_sales