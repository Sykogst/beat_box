require './lib/linked_list'
require './lib/node'

RSpec.describe LinkedList do
  before(:each) do
    @list = LinkedList.new
  end

  describe '#initialize' do
    it 'LinkedList class exists' do
      expect(@list).to be_instance_of(LinkedList)
    end

    it 'has head' do
      expect(@list.head).to be_nil
    end
  end

  describe '#append' do
    it 'append one thing' do
      @list.append('doop')
      expect(@list.head.data).to eq('doop')
      expect(@list.head.next_node).to be_nil
    end
    # it 'appends multiple things' do
    # end
  end

  # describe '#count' do
  #   it 'has a count' do
  #     @list.count.append('doop')
  #     expect(@list.count)
  #   end
  end
end