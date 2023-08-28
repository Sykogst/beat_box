class BeatBox
  attr_reader :list, :count
  def initialize
    @list = LinkedList.new
  end

  def append(more_data)
    more_data_separated = more_data.split(' ')
    more_data_separated.each { |node_data| @list.append(node_data) }
  end

  # Kind of uncertain why this is useful?
  def count
    @list.count
  end

  def play
    `say -r 500 -v Cellos #{@list.to_string}`
  end
end