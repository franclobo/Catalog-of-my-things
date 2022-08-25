require_relative '../author'
require_relative '../item'

describe Author do
  context 'when initialized' do
    before(:all) do
      @author = Author.new('John', 'Doe')
      @item = Item.new(2020)
    end

    it 'should have an id' do
      expect(@author.id).to be_a Integer
    end
    it 'should have a first name' do
      expect(@author.first_name).to eq 'John'
    end
    it 'should have a last name' do
      expect(@author.last_name).to eq 'Doe'
    end

    it 'should add an item' do
      expect(@author.add_item(@item)).not_to be_nil
    end
  end
end
