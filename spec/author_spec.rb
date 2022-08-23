require_relative '../author'

describe Author do
  it 'should be initialized with first_name and last_name' do
    author = Author.new('John', 'Doe')
    expect(author.first_name).to eq 'John'
    expect(author.last_name).to eq 'Doe'
  end

  it 'should have an add_item method' do
    author = Author.new('John', 'Doe')
    expect(author).to respond_to(:add_item)
  end
end
