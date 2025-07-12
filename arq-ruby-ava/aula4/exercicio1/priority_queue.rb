class PriorityQueue
  attr_reader :low, :medium, :high

  def initialize
    @low = Queue.new
    @medium = Queue.new
    @high = Queue.new

    @threads = Array.new(2) do
      Thread.new do
        loop do
          sleep 0.2
          job = next_queue&.pop
          job&.call
        end
      end
    end
  end

  def schedule(priority: :low, &block)
    raise ArgumentError, "Invalid priority, pririty must be :low, :medium or high" unless [:low, :medium, :high].include?(priority)

    self.send("#{priority}") << block
  end

  private

  attr_writer :low, :medium, :high

  def next_queue
    return @high unless @high.empty?
    return @medium unless @medium.empty?
    return @low unless @low.empty?
  end
end
