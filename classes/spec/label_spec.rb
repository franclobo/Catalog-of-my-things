require_relative '../label'
require_relative '../book'

describe Label do
  context 'When testing the label class' do
    before(:all) do
      @label = Label.new('Label', 'White')
    end

    it 'The label class constructor' do
      expect(@label.title).to eq 'Label'
      expect(@label.color).to eq 'White'
      expect(@label.items).to eq []
    end

    it 'Check if can add_items' do
      item = Book.new('Publisher', 'bad', 2020)
      @label.add_item(item)
      expect(@label.items.length).to eq 1
      expect(item.label).to eq @label
    end
  end
end
