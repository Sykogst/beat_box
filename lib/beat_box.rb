class BeatBox
  attr_reader :list
  def initialize
    @list = LinkedList.new
  end

  def append(more_data)
    beats_dictionary = 'tee dee deep bop boop la na boo witt bonk rit goop sit'
    beats_dictionary_separated = beats_dictionary.split(' ')
    more_data_separated = more_data.split(' ')
    valid_beats = more_data_separated.find_all do |node_data|
      beats_dictionary_separated.each { |beat| node_data == beat }
    end

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