require './lib/node'

RSpec.describe Node do
  describe '#initialize' do
    it 'Node class exists' do
      node = Node.new('plop')
      expect(node).to be_instance_of(Node)
    end
  end
end