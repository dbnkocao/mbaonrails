require_relative './matched_lines'
require_relative './parallel'

class FindText
  include Parallel

  attr_accessor :file_path, :search_term, :matched_lines

  def initialize
    @matched_lines = MatchedLines.new
  end

  def search
    lines.each_with_index do |line, i|
      schedule(queue: :high_priority) do
        if line.match?(search_term)
          schedule(queue: :medium_priority) do
            synchronize { matched_lines << { line: line, line_number: i + 1, matched_term: search_term } }
          end
        end
      end
    end
  end

  def lines
    File.readlines(@file_path)
  end

  def reset_search
    @file_path = nil
    @search_term = nil
    @matched_lines = MatchedLines.new
  end
end