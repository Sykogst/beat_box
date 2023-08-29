class BeatBox
  attr_reader :list
  def initialize(first_beats)
    @beats_dictionary = 'tee dee deep bop boop la na boo witt bonk rit goop sit'
    @list = LinkedList.new
    # Was not able to call the append method from outside initialize method
    if first_beats == ''
      @list
    else
      beats_dictionary_separated = @beats_dictionary.split(' ')
      first_beats_separated = first_beats.split(' ')
      valid_beats = first_beats_separated.select do |node_data|
        beats_dictionary_separated.include?(node_data)
      end
      valid_beats.each { |valid_beat| @list.append(valid_beat) }
    end
##
  end

  def append(more_data)
    # Both input string and beats dictionary are split into arrays
    beats_dictionary_separated = @beats_dictionary.split(' ')
    more_data_separated = more_data.split(' ')
    # Use find_all to collect all valid input node data
    valid_beats = more_data_separated.select do |node_data|
      # Does dictionary array contain the current piece of data
      beats_dictionary_separated.include?(node_data)
    end
    # Append each beat from the valid_beats array
    valid_beats.each { |valid_beat| @list.append(valid_beat) }
  end

  def prepend(more_data)
    beats_dictionary_separated = @beats_dictionary.split(' ')
    # Input array needs to be reversed to add from beginning
    more_data_separated = more_data.split(' ').reverse
    valid_beats = more_data_separated.select do |node_data|
      beats_dictionary_separated.include?(node_data)
    end
    # Prepend each beat from the valid_beats array
    valid_beats.each { |valid_beat| @list.prepend(valid_beat) }
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