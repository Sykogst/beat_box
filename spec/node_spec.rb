require './lib/node'

RSpec.describe Node do
  describe '#initialize' do
    it 'Node class exists' do
      node = Node.new('plop')
      expect(node).to be_instance_of(Node)
    end

    it 'has data attribute' do
      node = Node.new('plop')
      expect(node.data).to eq('plop')
    end

    it 'has next_node attribute' do
      node = Node.new('plop')
      expect(node.next_node).to eq(nil)
    end
  end
end