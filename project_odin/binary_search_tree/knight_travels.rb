class Node
  attr_accessor :position, :parent, :children, :level
  def initialize(position, parent = nil, level = 0)
    @position = position
    @parent = parent
    @level = level
    @children = []
  end

  def build_children(node)
    moves = possible_moves(node.position)
    moves.each do |pos|
      node.children << Node.new(pos, node, node.level + 1)
    end
  end

  def possible_moves(position)
    possible_moves = []
    possible_moves << [position[0]+2, position[1]+1]
    possible_moves << [position[0]+2, position[1]-1]
    possible_moves << [position[0]+1, position[1]+2]
    possible_moves << [position[0]+1, position[1]-2]
    possible_moves << [position[0]-1, position[1]+2]
    possible_moves << [position[0]-1, position[1]-2]
    possible_moves << [position[0]-2, position[1]+1]
    possible_moves << [position[0]-2, position[1]-1]
    possible_moves.select! do |pos|
      (1..8).include?(pos[0]) && (1..8).include?(pos[1])
    end
    possible_moves
  end

end

class Tree
  attr_accessor :root
  def initialize(starting_position)
    @root = Node.new(starting_position, nil, 0)
  end

  def build_tree(levels, node = @root)

  end

  def build_tree_until(target, node = @root)

  end
end