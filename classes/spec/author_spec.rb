require_relative '../author'

describe Author do
  context 'when initialized' do
    before(:all) do
      @author = Author.new('John', 'Doe')
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
      item = double('Item')
      allow(item).to receive(:author)
      expect(item).to receive(:author).with(@author)
      @author.add_item(item)
      expect(@author.items).to eq [item]
    end
  end
end
