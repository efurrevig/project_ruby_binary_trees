# 1) Get the Middle of the array and make it root.
# 2) Recursively do same for left half and right half.
#       a) Get the middle of left half and make it left child of the root
#           created in step 1.
#       b) Get the middle of right half and make it right child of the
#           root created in step 1.

class Tree

    attr_accessor :root

    def initialize(array)
        @root = build_tree(array)

    end

    def build_tree(array)
        #takes an array of data and turns it into a blanaced binary tree
        #sort and remove duplicates
        #return level 0 root node
        return nil if array.length == 0

        middle = (array.length - 1)/2
        root = Node.new(array[middle])

        root.left = build_tree(array[0...middle])
        root.right = build_tree(array[(middle+1)..-1])

        root

    end

    def insert(value, node = @root)
        #accepts a value to insert
        if node.nil?
            return Node.new(value)
        end

        if node.value == value
            puts "This value already exists"
        elsif node.value < value
            node.right = insert(value, node.right)
        elsif node.value > value
            node.left = insert(value, node.left)
        end

        node

    end

    def delete(value, node = @root)

        return node if node.nil?

        if value < node.value
            node.left = delete(value, node.left)

        elsif value > node.value
            node.right = delete(value, node.right)
        
        else
            return node.right if node.left.nil?
            return node.left if node.right.nil?

            temp = minValueNode(node.right)
            node.value = temp.value
            node.right = delete(temp.value, node.right)
        end

        node
 
    end

    def minValueNode(node)
        current = node
        
        while !current.left.nil?
            current = current.left
        end

        current
    end

    def find(value, node = @root)
        if node.nil?
            puts "This value doesn't exist"
        end

        return node if node.value == value

        if node.value < value
            find(value, node.right)
        elsif node.value > value
            find(value, node.left)
        end
    end

    def level_order
        return if root.nil?

        queue = [@root]
        result = []

        while !queue.empty?
            node = queue.shift
            block_given? ? yield(node) : result << node.value
            queue << node.left unless node.left.nil?
            queue << node.right unless node.right.nil?
        end

        result unless block_given?

    end

    def inorder(node = @root, result = [])
        #left root right
        return if node.nil?

        if !node.left.nil?
            inorder(node.left, result)
        end

        block_given? ? yield(node) : result << node.value

        if !node.right.nil?
            inorder(node.right, result)
        end

        result
    end

    def preorder(result = [], node = @root)
        return if node.nil?

        block_given? ? yield(node) : result << node.value

        if !node.left.nil?
            preorder(result, node.left)
        end

        if !node.right.nil?
            preorder(result, node.right)
        end

        result

            
        #root left right
    end

    def postorder(result = [], node = @root)
        return if node.nil?

        if !node.left.nil?
            postorder(result, node.left)
        end
        if !node.right.nil?
            postorder(result, node.right)
        end

        block_given? ? yield(node) : result << node.value
    
        #left right root
    end

    def height(node = @root)
        return 0 if node.nil?

        left_height = height(node.left)
        right_height = height(node.right) 

        return [left_height, right_height].max + 1
        #accepts a node and returns its height.
        #height is defined as the number of edges in longest path from a given node
        # to a leaf node
    end

    def depth(node = @root, value)
        return 0 if node == value || node.nil?

            right_depth = depth(node.right, value)
            left_depth = depth(node.left, value)

        return [left_depth, right_depth].min + 1
        #acceps a node and returns its depth.
        #depth is defined as the number of edges in a path from a given node to the 
        # tree's root node
    end

    def balanced?
        return (height(@root.right) - height(@root.left)).abs <= 1
        #checks if the tree is balanced.
        #diff of heights of left and right subtree ! > 1
    end

    def rebalance
        @root = build_tree(inorder())
        #rebalances an unbalanced tree
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '???   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '????????? ' : '????????? '}#{node.value}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '???   '}", true) if node.left
    end


end