require_relative 'node.rb'
require_relative 'tree.rb'

test_array = [2, 4, 6, 8, 10, 12, 14, 16]

tree = Tree.new(test_array)

tree.insert(1)
tree.insert(3)
tree.insert(5)
tree.pretty_print

q = Queue.new
q.push(1)
q.push(2)
q.push(3)
q.push(4)
c = q.pop
puts c