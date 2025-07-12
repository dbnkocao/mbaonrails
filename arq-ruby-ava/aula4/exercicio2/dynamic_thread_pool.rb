class DynamicThreadPool
    attr_reader :low, :medium, :high, :max_threads, :min_threads, :threads

  def initialize(max_threads: 2)
    raise ArgumentError, "max_threads must be greater or equal to 2" if max_threads < 2
    @mutex = Mutex.new
    @low = Queue.new
    @medium = Queue.new
    @high = Queue.new
    @max_threads = max_threads
    @min_threads = 2

    @threads = Array.new(min_threads) do
      Thread.new do
        loop do
          remove_dead_threads
          dynamic_growth

          sleep 1
          job = next_queue&.pop
          job&.call
          puts "treads/jobs(#{threads.size}/#{queued_jobs})"
        end
      end
    end
  end

  def schedule(priority: :low, &block)
    raise ArgumentError, "Invalid priority, pririty must be :low, :medium or high" unless [:low, :medium, :high].include?(priority)

    self.send("#{priority}") << block
  end

  def shutdown
    threads.each &:kill
    remove_dead_threads
    puts "All Threads was stopped"
  end

  private

  attr_writer :low, :medium, :high, :threads

  def remove_dead_threads
    threads.select! &:status
  end

  def dynamic_growth
    while threads.size < queued_jobs
      break if threads.size > max_threads
      threads << Thread.new do
        sleep 1
        job = next_queue&.pop
        job&.call
        puts "treads/jobs(#{threads.size}/#{queued_jobs})"
      end
    end
  end

  def queued_jobs
    high.size + medium.size + low.size
  end

  def next_queue
    @mutex.synchronize do
      return @high unless @high.empty?
      return @medium unless @medium.empty?
      return @low unless @low.empty?
    end
  end
end