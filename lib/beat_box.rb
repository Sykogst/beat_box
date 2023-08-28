class BeatBox
  attr_reader :list, :count
  def initialize
    @list = LinkedList.new
  end

  def append(more_data)
    more_data_separated = more_data.split(' ')
    more_data_separated.each { |node_data| @list.append(node_data) }
  end

  def count
    @list.count
  end

  def to_string
    @list.to_string
  end

  def play
    `say -r 500 -v Cellos #{to_string}`
  end
end