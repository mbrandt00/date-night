class Node
  attr_accesor :value, :movie, :left, :right, :depth, :parent 
  def initialize(value, movie)
    @value = value
    @movie = movie
    @left = nil
    @right = nil
    @depth = 0
    @parent = nil
  end

end
