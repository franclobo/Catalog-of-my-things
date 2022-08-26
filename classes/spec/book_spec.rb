require_relative '../book'

describe Book do
  context 'When testing the book class' do
    before(:all) do
      @book = Book.new('Publisher', 'bad', 2020)
    end

    it 'The book class constructor' do
      expect(@book.publisher).to eq 'Publisher'
      expect(@book.cover_state).to eq 'bad'
      expect(@book.publish_date).to eq 2020
    end

    it 'Check if the book can_be_archived' do
      expect(@book.send(:can_be_archive?)).to be true
      @book.cover_state = 'good'
      expect(@book.send(:can_be_archive?)).to be false
    end
  end
end
