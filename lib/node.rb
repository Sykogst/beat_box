class Node
  attr_reader :data, :next_node
  def initialize(data)
    @data = data
    @next_node = nil
  end

  # Allow new node to be set as pointer
  def next_node=(new_node)
    @next_node = new_node
  end
end