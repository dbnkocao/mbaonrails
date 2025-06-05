class Vector2
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def *(other)
    if other.is_a?(Vector2)
      result = @x * other.x + @y * other.y
      puts "Output: #{result} (dot product)"
    elsif other.is_a?(Numeric)
      puts "Output: (#{@x * other}, #{@y * other}) "
    else
      raise ArgumentError, "Multiplicação só é suportada com outro Vector2 ou Numeric"
    end
  end
end



