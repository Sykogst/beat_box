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
      expect(@list.count).to eq(4)
    end
  end

  describe '#insert' do
    it 'adds node at after specified location in list' do
      @list.insert(2,'boop')
      expect(@list.to_string).to eq('boop')
      @list.prepend('kee')
      expect(@list.to_string).to eq( 'kee boop')
      @list.insert(0, 'blip')
      expect(@list.to_string).to eq('blip kee boop')
      @list.insert(1, 'zap')
      expect(@list.to_string).to eq('blip zap kee boop')  
      @list.insert(10, 'goot')  
      expect(@list.to_string).to eq('blip zap kee boop goot') 
      @list.insert(4, 'woot')
      expect(@list.to_string).to eq('blip zap kee boop woot goot') 
    end
  end

  describe '#find' do
    it 'returns elements after given index as a string' do
      @list.append('deep')
      expect(@list.to_string).to eq('deep')
      expect(@list.find(0, 1)).to eq('deep')
      @list.append('woo')
      @list.append('zap')
      @list.append('kaa')
      @list.append('bloop')
      expect(@list.to_string).to eq('deep woo zap kaa bloop')
      expect(@list.find(2,1)).to eq('zap')
      expect(@list.find(1,3)).to eq('woo zap kaa')
    end

    it 'returns nil for invalid cases: no elements, start_index beyond count' do
      expect(@list.find(1,1)).to be_nil
      @list.append('deep')
      @list.append('woo')
      @list.append('zap')
      expect(@list.find(3,2)).to be_nil
    end

    it 'only returns nodes up until the last node' do
      @list.append('deep')
      @list.append('woo')
      @list.append('zap')
      expect(@list.find(0,4)).to eq('deep woo zap')
      expect(@list.find(2,3)).to eq('zap')
    end
  end
end