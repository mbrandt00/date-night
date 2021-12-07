class BinarySearchTree
  attr_reader :root, :all_nodes, :sorted_array, :change_in_depth, :initial_node
  def initialize()
    @root = nil
    @size = 0
    @all_nodes = []
    @change_in_depth
    @sorted_array_raw = []
    @initial_node = initial_node
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
        # previous_node.child = previous_node.left
        previous_node.left.parent = previous_node
        previous_node.left.depth = depth_counter
        @all_nodes << previous_node.left
      else
        previous_node.right = Node.new(value, movie)
        # previous_node.child = previous_node.left
        previous_node.right.parent = previous_node
        previous_node.right.depth = depth_counter
        @all_nodes << previous_node.right

      end
    end
    @size += 1
    return @all_nodes.last.depth
  end

  def include?(value)
    @all_nodes.each do |node|
      if node.value == value
        return true
      else
        return false
      end
    end
  end

  def max
    current_node = @root
    previous_node = @root
    while current_node != nil
      previous_node = current_node
      current_node = current_node.right
    end
    return previous_node
  end

  def min(node = @root)
    current_node = node
    previous_node = node
    while current_node != nil
      previous_node = current_node
      current_node = current_node.left
    end
    return previous_node
  end

  def sorter(node)
    @initial_node = node
    until @sorted_array.length == 3
      next_min = node
      if next_min== nil
        @initial_node = self.initial_node.parent
        node = @initial_node
      elsif next_min.left == nil #terminal point on left
        @sorted_array << {next_min.movie => next_min.value}
        @sorted_array_raw << next_min
        node = next_min.right
      elsif node.left != nil && node == @initial_node
        @sorted_array << {node.movie => node.value}
      elsif node.left != nil #if nodes to left
        next_min = node.left
        if next_min.left == nil # terminal on left
          @sorted_array << {next_min.movie => next_min.value}
          @sorted_array_raw << next_min
          node = next_min.right
        elsif next_min.left != nil
          node = next_min.left
        end
      end
    end
  end

  def sort
    min
    @sorted_array = []
    sorter(min)
    # sorter(min.parent)
    return @sorted_array
  end
end
