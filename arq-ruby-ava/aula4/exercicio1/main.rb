require './priority_queue'


queue = PriorityQueue.new

(1..10).each do |i|
  queue.schedule(priority: :low) { puts "Low priority task ##{i}" }
end

(1..10).each do |i|
  queue.schedule(priority: :medium) { puts "Medium priority task ##{i}" }
end

(1..10).each do |i|
  queue.schedule(priority: :high) { puts "High priority task ##{i}" }
end


