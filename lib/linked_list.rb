class LinkedList
  attr_reader :head
  # Linked list has three types of state
  # Head of the list, data of each node, next node of each node
  def initialize
    @head = nil
  end

  def append(data)
    new_node = Node.new(data)
    # If no head exists, new_node is assigned as the head
    if @head == nil
      @head = new_node
    else
      # Tail node has a next_node value of nil
        # Increment to next node
      # Add new node to end

    end
  end

  def count
    if @head == nil
      count = 0
    else 
      count = 1
    end
  end

  def to_string
    linked_list_string = ''
    if @head == nil
      linked_list_string
    else
      linked_list_string << @head.data
    end
  end
end