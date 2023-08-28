require './lib/beat_box'
require './lib/linked_list'
require './lib/node'

RSpec.describe LinkedList do
  before(:each) do
    @bb = BeatBox.new
  end

  describe '#initialize' do
    it 'BeatBox class exists' do
      expect(@bb).to be_instance_of(BeatBox)
    end

    it 'has list' do
      expect(@bb.list).to be_instance_of(LinkedList)
    end

    it 'has head' do
      expect(@bb.list.head).to be_nil
    end
  end

  describe '#append_lots' do
    it 'append multiple at once' do
      @bb.append_lots('deep boo witt')
      expect(@bb.list.head.data).to eq ('deep')
      expect(@bb.list.head.next_node.data).to eq ('boo')
      @bb.append_lots('bonk rit goop')
      expect(@bb.list.to_string).to eq('deep boo witt bonk rit goop')
      
    end

    it 'append multiple with extra spacing' do
      @bb.append_lots('deep    boo  witt')
      expect(@bb.list.head.data).to eq ('deep')
    end
  end

  describe '#count_bb' do
      it 'has count for bb' do
      @bb.append_lots('deep boo witt')
      @bb.append_lots('bonk rit goop')
      expect(@bb.count_bb).to eq(6)
    end
  end
end