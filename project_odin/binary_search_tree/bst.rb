class Node
  attr_accessor :value, :left, :right
  def initialize(value = nil)
    @value = value
    @left = nil
    @right = nil
  end
end

class Tree
  attr_accessor :root
  def initialize(root)
    @root = root
  end

  # Search through tree nodes until we find a space
  def insert_node(tree_node, value)

    # Base Case: Found a space
    if tree_node.nil?
      tree_node = Node.new(value)

    elsif tree_node.value == value
      tree_node.value = value
    elsif tree_node.value < value
      tree_node.right = insert_node(tree_node.right, value)
    else
      tree_node.left = insert_node(tree_node.left, value)
    end
    tree_node
  end

  def search(tree_node, value)
    # Base Case : Found it
    return tree_node if tree_node.value == value

    # Base Case : Doesn't exist
    return nil if tree_node.nil?

    # Recursive Search - Search Right or Left Subtree
    if tree_node.value > value
      tree_node = search(tree_node.left, value)
    else
      tree_node = search(tree_node.left, value)
    end
    tree_node
  end


end