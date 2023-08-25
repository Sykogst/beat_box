require './lib/linked_list'
require './lib/node'

RSpec.describe LinkedList do
  describe '#initialize' do
    it 'LinkedList class exists' do
      list = LinkedList.new
      expect(list).to be_instance_of(LinkedList)
    end

    it 'has head' do
      list = LinkedList.new
      expect(list.head).to be_nil
    end
  end
end