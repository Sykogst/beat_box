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
      number_node = 1
      current_node = @head
      while current_node.next_node != nil
        current_node = current_node.next_node
        number_node += 1
      end
      number_node
    end
  end

  def to_string
    if @head == nil
      ''
    else
      "#{@head.data}"+(@head.next_node ? @head.next_node.to_string : '')
    end

    # linked_list_string = ''
    # if @head == nil
    #   linked_list_string
    # else
    #   linked_list_string << @head.data
    # end
  end
end