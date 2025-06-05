require './vector2'

module VectorMultiplication
  def *(other)
    if other.is_a?(Vector2)
      puts "Output: (#{other.x * self}, #{other.y * self}) "
    elsif other.is_a?(Numeric)
      super
    end
  end
end

Integer.prepend VectorMultiplication
Float.prepend VectorMultiplication

# Testando a classe Vector2
v = Vector2.new(3, 4)
puts v * 2 # Output: (6, 8)
puts v * 2.5 # Output: (7.5, 10.0)
puts v * v # Output: 25 (dot product)
puts 2 * v # Output: (6, 8)
puts 2.5 * v # Output: 0(7.5, 10.0)