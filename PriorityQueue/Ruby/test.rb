require_relative 'my_max_pq'
#require_relative 'key'

q = MyMaxPq.new

p q.isEmpty?
p "PQ size = #{q.size}"

p "q << 0"
q << 0
p "keys: #{q.keys}"
p "size = #{q.size}"
p " "

p "q << 2"
q << 2
p "keys: #{q.keys}"
p "size = #{q.size}"
p " "

p "q << 5"
q << 5
p "keys: #{q.keys}"
p "size = #{q.size}"
p " "

q << 7
p "q << 7"
p "keys: #{q.keys}"
p "size = #{q.size}"
p " "


q << -5
p "q << 11"
p "keys: #{q.keys}"
p "size = #{q.size}"
p " "

z = nil
p "Pop max value: #{z}"
z = q.pop
p "#{z}"
p q.keys
p " "

p "pop 5"
z = nil
p "Pop max value: #{z}"
z = q.pop
p "#{z}"
p q.keys
