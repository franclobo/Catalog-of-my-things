require_relative '../genre'

describe Genre do
  context 'When create a genre' do
    before(:all) do
      @genre = Genre.new('Pop')
    end

    it 'add an item' do
      expect(@genre.items).to eq []
      @genre.add_item(double('Item'))
      expect(@genre.items).to eq [double('Item')]
    end

    it 'has a name' do
      expect(@genre.name).to eq 'Pop'
    end
  end
end
