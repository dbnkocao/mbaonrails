require_relative './colorize'

class MatchedLines
  attr_reader :lines
  include Enumerable
  include Colorize

  def initialize
    @lines = []
  end

  def each(&block)
    @lines.each(&block)
  end

  def <<(line)
    @lines << line
  end

  def print
    @lines.each do |match|
      puts "#{match[:line_number]}-#{high_light_blue(text: match[:line], highlight_word: match[:matched_term])}"
    end
  end
end