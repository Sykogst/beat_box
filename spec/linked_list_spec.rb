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
    it 'append one thing with data, assigns node as head' do
      @list.append('doop')
      expect(@list).to be_instance_of(LinkedList)
      expect(@list.head.data).to eq('doop')
      expect(@list.head.next_node).to be_nil
    end

    it 'appends multiple things' do
      # Makes node head, points to nothing
      @list.append('doop')
      second_node = @list.append('deep')
      expect(@list.head.next_node).to eq(second_node)
      third_node = @list.append('boop')
      expect(@list.head.next_node.next_node).to eq(third_node)
    end
  end

  describe '#count' do
    it 'has a count' do
      expect(@list.count).to eq(0)
      @list.append('doop')
      expect(@list.count).to eq(1)
      @list.append('deep')
      expect(@list.count).to eq(2)
      @list.append('boop')
      expect(@list.count).to eq(3)
    end
  end

  describe '#to_string' do
    it 'has a string after adding one node' do
      expect(@list.to_string).to eq('')
      @list.append('doop')
      expect(@list.to_string).to eq('doop')
      @list.append('deep')
      expect(@list.to_string).to eq('doop deep')
      @list.append('boop')
      expect(@list.to_string).to eq('doop deep boop')
    end

    it 'different append arguments' do
      @list.append('boop')
      @list.append('')
      expect(@list.to_string).to eq('boop ')
      @list.append('beep')
      expect(@list.to_string).to eq('boop  beep')
      @list.append(nil)
      expect(@list.to_string).to eq('boop  beep ')
    end
  end

  describe '#prepend' do
    it 'adds node to beginning of list, head is new node' do
      @list.append('boop')
      @list.prepend('kee')
      expect(@list.to_string).to eq('kee boop')
      @list.prepend('wop')
      expect(@list.to_string).to eq('wop kee boop')
      @list.prepend(' pop ')
      expect(@list.to_string).to eq(' pop  wop kee boop')
    end
  end
end