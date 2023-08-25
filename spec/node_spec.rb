require './lib/node'

RSpec.describe Node do
  before(:each) do
    @node = Node.new('plop')
  end

  describe '#initialize' do
    it 'Node class exists' do
      expect(@node).to be_instance_of(Node)
    end

    it 'has data attribute' do
      expect(@node.data).to eq('plop')
    end

    it 'has next_node attribute' do
      expect(@node.next_node).to eq(nil)
    end
  end
end