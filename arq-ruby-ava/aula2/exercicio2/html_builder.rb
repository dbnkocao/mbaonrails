class HtmlBuilder
  attr_reader :block

  def initialize(&block)
    @html = ""
    @block = block
  end

  def div(content = "", &block)
    @html << "<div>"
    yield if block_given?
    @html << content
    @html << "</div>"
  end

  def span(content)
    @html << "<span>"
    yield if block_given?
    @html << content
    @html << "</span>"
  end

  def result
    instance_eval(&@block)
    puts @html
  end
end
