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

    xit 'has list' do
      expect(@bb.list).to be_instance_of(LinkedList)
    end

    xit 'has head' do
      expect(@bb.list.head).to be_nil
    end
  end


end