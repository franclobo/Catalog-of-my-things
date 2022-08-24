require_relative '../author'

describe Author do
  context 'when initialized' do
    it 'should have an id' do
      author = Author.new('John', 'Doe')
      expect(author.id).to be_a Integer
    end
    it 'should have a first name' do
      author = Author.new('John', 'Doe')
      expect(author.first_name).to eq 'John'
    end
    it 'should have a last name' do
      author = Author.new('John', 'Doe')
      expect(author.last_name).to eq 'Doe'
    end
  end

  context 'when adding items' do
    it 'should add an item' do
      author = Author.new('John', 'Doe')
      item = double('Item')
      allow(item).to receive(:author)
      expect(item).to receive(:author).with(author)
      author.add_item(item)
      expect(author.items).to eq [item]
    end
  end
end
