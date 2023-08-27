class LinkedList
  attr_reader :head, :data
  # Linked list has three types of state
  # Head of the list, data of each node, next node of each node
  def initialize
    @head = nil
  end

  # Need a way to scan through nodes

  def append(new_data)
    new_node = Node.new(new_data)
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

  def prepend(new_data)
    new_node = Node.new(new_data)
    if @head!= nil
      # Make pointer of new node the current head
      new_node.next_node = @head
      # Assign new node as head
      @head = new_node
    # No head at all, prepend also makes new node head
    else
      @head = new_node
    end
  end

  def insert(index_node, new_data)
    new_node = Node.new(new_data)
    # Adds in node if nothing exists, makes it the head
    if @head == nil
      @head =  new_node 
    # Given index_node 0, makes it the new head
    elsif index_node == 0
      prepend(new_data) 
    elsif index_node < count && index_node > 0
      # Define some 'starting' positions
      insertion_location = index_node - 1
      current_node = @head
      start_nodes = @head
      # Loop to desired node by given index
      insertion_location.times { start_nodes = current_node.next_node }
      end_nodes = start_nodes.next_node
      # Start nodes point to new node
      start_nodes.next_node = new_node
      # New Node points to end nodes
      new_node.next_node = end_nodes
    else
      append(new_data)
    end
        
  end
end