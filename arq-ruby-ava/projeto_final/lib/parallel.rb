module Parallel
  attr_reader :high_priority, :medium_priority

  def init_threads(threads = 50)
    @mutex = Mutex.new
    @high_priority = Queue.new
    @medium_priority = Queue.new
    @threads = Array.new(threads) do
      Thread.new do
        loop do
          job = next_queue&.pop
          job&.call
        end
      end
    end
  end

  def schedule(queue:, &block)
    self.send("#{queue}") << block
  end


  def all_thread_finished?
    @high_priority.empty? && @medium_priority.empty?
  end

  def synchronize(&block)
    @mutex.synchronize(&block)
  end

  private

  def next_queue
    return @high_priority unless @high_priority.empty?
    return @medium_priority unless @medium_priority.empty?
    @high_priority
  end
end