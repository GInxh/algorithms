require 'benchmark/ips'

require_relative 'my_max_pq'
require_relative 'priority_queue'

mine = MyMaxPq.new 
other = PriorityQueue.new

100_000.times do |i|
  naive << 
