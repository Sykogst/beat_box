class BeatBox
  attr_reader :list, :append
  def initialize
    @list = LinkedList.new
  end

  def append_lots(more_data)
    more_data_separated = more_data.split(' ')
    more_data_separated.each { |node_data| @list.append(node_data) }
  end

  # Kind of uncertain why this is useful?
  def count_bb
    @list.count
  end
end