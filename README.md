# Beat Box - Sound Player Using Linked-Lists

## Description
- This is a basic drum machine program created with the linked-list data structure.
- Linked-lists are not a built in data structure in Ruby, so the basic structure was made using two classes: Node and LinkedList.
- A linked-list is a collection comprised of nodes; each node only can hold a single data element and a pointer to the next node on the list.
- The list itself only holds a single reference; the head node. The last node is called the tail node.
- A third class, BeatBox, was made in order to play a sound based on the data contained in each node of a linked-list.

## Functionality
### Class - Node
- Each node can only hold two items: a data element, a pointer to the next node.
- Data element state (data) has to stay static once assigned
- Next node state (next_node) was allowed to be read and written
### Class - LinkedList
- Linked list can have one state (head),  the start position of the list
- Head can be nil, for an empty list, or contain a node with a data element and pointer. Tail node will have a pointer to nil.
- Features and functionality of a linked list were added as methods in this class.
#### Method - append('beat')
- Accepts one argument, a string containing a single 'beat' and creates a new node.
- Assigns the new node as a head for an empty list, or adds the new node as the next node in the linked-list.
#### Method - count
- Returns the total number of nodes in the linked-list.
#### Method - to_string
- Returns the data from each node contained in the linked list as a string in the format: 'beat1 beat2 beat3 ...'
#### Method - prepend('beat')
- Accepts one argument, a string containing a single 'beat' and creates a new node.
- Assigns the new node as the head of the linked-list.
#### Method - insert(index_integer, 'beat')
- Accepts two arguments, an index_integer where a new node is inserted, and a string containing the beat data to be inserted.
- Creates a new node and inserts it at the given location
- Odd cases will be as follows
1. If linked-list is empty, it will assign the new node as the head
2. Argument index_integer of 0, is same as prepend (adds to beginning as new head)
3. Arguement index_integer larger than current count of linked list, is same as append (adds to end as link list as tail)
#### Method - find(start_index, number_nodes)
- Accepts two arguments, a start_index as an integer, and number_nodes to return as an integer.
- Index conventions follow siilarly to arrays and strings, where 0 is the first data element.
- The method returns the data in nodes as a string, starting at the given index and with the number of nodes input.
- If argument input for number_nodes goes over number of available nodes in the linked-list, node data is only output up until the end tail node.
- Will return nil in two cases
1. linked-list contains no nodes
2. start_index argument was larger than number of nodes in linked list.
#### Method - includes?('beat')
- Accepts one argument, a string containing the beat to search for.
- Returns a boolean depending on if the linked-list contains the input beat string.
#### Method - pop
- Returns node data in last element (tail) and removes the node.

### Class - BeatBox
- This class uses the linked-list data structure built to accept data, store this in nodes, and call on this information to play a sound from the terminal.
- When initializing an object instance of BeatBox, an arguement should be input in the form of a string of beats to be stored in nodes of a linked-list.
- This class allows more than one beat to be added in at once: upon initialization, or by using different methods.
- A 'dictionary' of valid beats is included in the class itself, and any non-valid beats input as arguments will be filtered out.
- BeatBox sound playback has a default voice of 'Cellos' and default rate of 500.
1. voice = 'Voice', method to change voice from default
2. rate = rateNumber, method to change rate from default
#### Method - append('beat1 beat2 beat3 ...')
- Append is now able to add multiple nodes at once to the linked-list.
- Non-valid beats will be filtered out and not added as nodes.
#### Method - prepend('beat1 beat2 beat3 ...')
- Prepend is noe able to add multiple nodes at once to the linked-list.
- Non-valud beats will be filtered out and not added as nodes.
#### Method - count
- Returns total count of nodes/beat data contained in the list.
#### Method - all
- Returns a string of all beat data contained in nodes/linked-list.
- This is the string of sounds that is played in the terminal.
#### play
- Plays the string of beats in the terminal using the default
#### reset_voice
- Changes sound voice back to default of 'Cellos'
#### reset_rate
- Changes sound play rate to defaul of 500
## Possible Improvements
- Refactor
1. Finally find a fix in the BeatBox initialize method, right now it can aceept multiple arguments...but it is repetitive. Should be able to use the append method directly?
2. 
- Add in more methods to have more linked-list functionality, some ideas:
1. remove, remove first node (head)
2. delete, delete node(s) from specific positions
3. clear, remove all nodes


## Contributors
- Sam Tran

## Resource(s)
[Info on attr methods](https://medium.com/@rossabaker/what-is-the-purpose-of-attr-accessor-in-ruby-3bf3f423f573) This source to learn how not use attr_accessor and allow to set new_node as next_node