module Colorize
  BLACK_BACKGROUND = "\e[40m"
  BLUE_BACKGROUND = "\e[44m"

  def high_light_blue(text:, highlight_word:)
    highlighted_text = text.gsub(highlight_word, "#{BLUE_BACKGROUND}#{highlight_word}#{BLACK_BACKGROUND}")
    puts highlighted_text
  end
end