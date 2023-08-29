require './lib/beat_box'
require './lib/linked_list'
require './lib/node'

RSpec.describe LinkedList do
  before(:each) do
    @bb = BeatBox.new('')
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

    it 'can append multiple nodes with argument' do
      bb_2 = BeatBox.new('dee dee denver bop')
      expect(bb_2.all).to eq('dee dee bop')
    end

    it 'has default rate' do
      @bb.append('tee tee tee deep bop')

    end

    it 'play default voice and play a different input voice' do
      @bb.append('boop boop boop')
      expect(@bb.play).to eq(`say -r 500 -v Cellos 'boop boop boop'`)
      @bb.voice = 'Daniel'
      expect(@bb.play).to eq(`say -r 500 -v Daniel 'boop boop boop'`)
    end

    it 'play at default rate and play at different input rate' do
      @bb.append('tee tee tee')
      expect(@bb.play).to eq(`say -r 500 -v Cellos 'tee tee tee'`)
      @bb.rate = 100
      expect(@bb.play).to eq(`say -r 100 -v Cellos 'tee tee tee'`)
    end

  end

  describe '#append' do
    it 'append multiple at once' do
      @bb.append('deep boo witt')
      expect(@bb.list.head.data).to eq ('deep')
      expect(@bb.list.head.next_node.data).to eq ('boo')
      @bb.append('bonk rit goop')
      expect(@bb.list.to_string).to eq('deep boo witt bonk rit goop')
      
    end

    it 'append multiple with extra spacing' do
      @bb.append('deep    boo  witt')
      expect(@bb.list.head.data).to eq ('deep')
    end

    it 'adds only valid beats' do
      @bb.append('deep bop woo')
      expect(@bb.all).to eq('deep bop')
      @bb.append('colorado tee tee denver bop bp')
      expect(@bb.all).to eq('deep bop tee tee bop')
    end
  end

  describe '#prepend' do
    it 'prepends only valid beats, multiple at once' do
      @bb.prepend('woop denver wenver bop dee pip dee')
      expect(@bb.all).to eq('bop dee dee')
    end
  end

  describe '#count' do
      it 'has count for bb' do
      @bb.append('deep boo witt')
      @bb.append('bonk rit goop')
      expect(@bb.count).to eq(6)
    end
  end

  describe '#to_string' do
    it 'has string from appended nodes' do
      @bb.append('deep boo witt bonk sit goop')
      expect(@bb.all).to eq('deep boo witt bonk sit goop') 
    end
  end

  describe '#play' do
    it 'makes sound' do
      @bb.append('deep boo witt bonk sit goop')
      expect(@bb.count).to eq(6)
      # Plays TWO sounds that are the same
      expect(@bb.play).to eq(`say -r 500 -v Cellos 'deep boo witt bonk sit goop'`)
    end
  end

  describe '#reset_voice' do
    it 'will reset to default Cellos after it was changed' do
      @bb.append('witt witt witt')
      @bb.voice = 'Daniel'
      expect(@bb.play).to eq(`say -r 500 -v Daniel 'witt witt witt'`)
      @bb.reset_voice
      expect(@bb.play).to eq(`say -r 500 -v Cellos 'witt witt witt'`)
    end
  end

  describe '#reset_rate' do
    it 'will reset to default rate after it was changed' do
      @bb.append('la la la')
      @bb.rate = 100
      expect(@bb.play).to eq(`say -r 100 -v Cellos 'la la la'`)
      @bb.reset_rate
      expect(@bb.play).to eq(`say -r 500 -v Cellos 'la la la'`)
    end
  end
end