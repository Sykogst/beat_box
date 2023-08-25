class LinkedList
  attr_reader :head
  # Linked list has three types of state
  # Head of the list, data of each node, next node of each node
  def initialize
    @data
    @next_node
    @head = nil
  end

  def append(data)
    if @head == nil
      @head = Node.new(data)
    else
    end
  end
end