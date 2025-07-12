require './dynamic_thread_pool'

queue = DynamicThreadPool.new(max_threads: 30)

100.times do |i|
  queue.schedule(priority: :low) { puts "Low priority task ##{i}" }
end

100.times do |i|
  queue.schedule(priority: :medium) { puts "Medium priority task ##{i}" }
end

100.times do |i|
  queue.schedule(priority: :high) { puts "High priority task ##{i}" }
end



