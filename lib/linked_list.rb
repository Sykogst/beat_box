class LinkedList
  attr_reader :head, :data
  # Linked list has three types of state
  # Head of the list, data of each node, next node of each node
  def initialize
    @head = nil
  end

  # Need a way to scan through nodes

  def append(data)
    new_node = Node.new(data)
    # If no head exists, new_node is assigned as the head
    if @head == nil
      @head = new_node
    else
      current_node = @head
      # Tail node has a next_node value of nil
      while current_node.next_node != nil
        # Increment to next node
        current_node = current_node.next_node
      end
      # Add new node to end
      current_node.next_node = new_node
    end
  end

  def count
    if @head == nil
      number_node = 0
    else 
      # Initialize, node counter for single head node
      number_node = 1
      current_node = @head
      # Iteration for beyond a single head node, stops when at tail
      while current_node.next_node != nil
        # Increment to next node and counter
        current_node = current_node.next_node
        number_node += 1
      end
      number_node
    end
  end

  def to_string
    node_data = []
    if @head == nil
      node_data
    else
      current_node = @head
      # Iteration to push in node data, starting with head node
      while current_node.next_node != nil
        node_data << current_node.data
        current_node = current_node.next_node
      end
      node_data << current_node.data
    end
    node_data.join(' ')
  end
end