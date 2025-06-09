class SalesReport
  attr_reader :sales
  include Enumerable

  def initialize(sales)
    @sales = sales
  end

  def each(&block)
    @sales.each(&block)
  end

  def total_by_category
    grouped_by_category.transform_values do |sales|
      sales.map{ |sale| sale[:amount] }.sum
    end
  end

  def grouped_by_category
    group_by { |sale| sale[:category] }
  end

  def top_sales(n)
    sort_by { |sale| sale[:amount] }.reverse.first(n)
  end

  def above_average_sales
    select { |sale| sale[:amount] > sales_average}
  end

  def sales_average
    sum { |sale| sale[:amount] } / count
  end
end