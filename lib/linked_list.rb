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

  def insert(insert_index, new_data)
    new_node = Node.new(new_data)
    # Adds in node if nothing exists, makes it the head
    if @head == nil
      @head =  new_node 
    # Given insert_index 0, makes it the new head
    elsif insert_index == 0
      prepend(new_data)
    # Inserting inbetween
    elsif insert_index > count 
      append(new_data)
    else
      # Define some 'starting' positions
      before_index = insert_index - 1
      current_node = @head
      start_nodes = @head
      # Loop to the nodes before insertion point
      before_index.times { start_nodes = start_nodes.next_node }
      # Loop to desired node to insert at
      insert_index.times { current_node = current_node.next_node }
      # Nodes after insertion point
      end_nodes = start_nodes.next_node
      # Start nodes point to new node
      start_nodes.next_node = new_node
      # New Node points to end nodes
      new_node.next_node = end_nodes
    # Any given indexes larger than size of list, appends
    end
  end

    def find(start_index, number_nodes)
      if @head == nil || start_index > count - 1 
        nil
      else
        found_nodes = []
        current_node = @head
        start_index.times { current_node = current_node.next_node }
        number_nodes.times do
          found_nodes << current_node.data
          current_node = current_node.next_node
        end
        found_nodes.join(' ')
      end
    end
  
end