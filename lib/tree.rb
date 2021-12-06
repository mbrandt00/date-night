class BinarySearchTree
  attr_reader :root, :all_nodes
  def initialize()
    @root = nil
    @size = 0
    @all_nodes = []
  end

  def insert(value, movie)
    if @root == nil #initial root
      @root = Node.new(value, movie)
      @all_nodes << @root
    else
      current_node = @root
      previous_node = @root
      depth_counter = 0
      while current_node != nil #finding last defined node
        previous_node = current_node

        if value < current_node.value
          current_node = current_node.left
        else
          current_node = current_node.right
        end
        depth_counter += 1
      end
      if value < previous_node.value #setting new node from terminal point
        previous_node.left = Node.new(value, movie)
        previous_node.left.parent = previous_node
        previous_node.left.depth = depth_counter
        @all_nodes << previous_node.left
      else
        previous_node.right = Node.new(value, movie)
        previous_node.right.parent = previous_node
        previous_node.right.depth = depth_counter
        @all_nodes << previous_node.right

      end
    end
    @size += 1
    return @all_nodes.last.depth
  end
end
