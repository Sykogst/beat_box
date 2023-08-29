class BeatBox
  attr_reader :list
  def initialize
    @list = LinkedList.new
  end

  def append(more_data)
    # String list of valid beats
    beats_dictionary = 'tee dee deep bop boop la na boo witt bonk rit goop sit'
    # Both input string and beats dictionary are split into arrays
    beats_dictionary_separated = beats_dictionary.split(' ')
    more_data_separated = more_data.split(' ')
    # Use find_all to collect all valid input node data
    valid_beats = more_data_separated.select do |node_data|
      # Does dictionary array contain the current piece of data
      beats_dictionary_separated.include?(node_data)
    end
    # Append each beat from the valid_beats array
    valid_beats.each { |valid_beat| @list.append(valid_beat) }
  end

  def count
    @list.count
  end

  def all
    @list.to_string
  end

  def play
    `say -r 500 -v Cellos #{all}`
  end
end