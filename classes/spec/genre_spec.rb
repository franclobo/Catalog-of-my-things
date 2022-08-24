require_relative '../genre'
require_relative '../item'

describe Genre do
  context 'When create a genre' do
    before(:all) do
      @genre = Genre.new('Pop')
      @item = Item.new(2020)
    end

    it 'add an item' do
      expect(@genre.add_item(@item)).not_to be_nil
    end

    it 'has a name' do
      expect(@genre.name).to eq 'Pop'
    end
  end
end
