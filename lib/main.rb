require_relative 'node.rb'
require_relative 'tree.rb'

# test_array = [2, 4, 6, 8, 10, 12, 14, 16]

# tree = Tree.new(test_array)

# tree.insert(1)
# tree.insert(3)
# tree.insert(5)
# tree.insert(18)
# tree.insert(20)
# tree.insert(21)
# tree.pretty_print
# tree.rebalance
# tree.pretty_print

def driver_script
    array = Array.new(15) {rand(1..100)}
    array = array.sort
    tree = Tree.new(array)
    tree.pretty_print
    puts "Tree balanced?: #{tree.balanced?}"
    puts "Pre-order: #{tree.preorder}"
    puts "In-order: #{tree.inorder}"
    puts "Post-order: #{tree.postorder}"
    tree.insert(101)
    tree.insert(121)
    tree.insert(115)
    tree.insert(104)
    tree.insert(191)
    tree.pretty_print
    puts "Tree balanced?: #{tree.balanced?}"
    tree.rebalance
    tree.pretty_print
    puts "Tree balanced?: #{tree.balanced?}"
    puts "Pre-order: #{tree.preorder}"
    puts "In-order: #{tree.inorder}"
    puts "Post-order: #{tree.postorder}"
end

driver_script