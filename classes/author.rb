class Author
  attr_accessor :first_name, :last_name
  attr_reader :id, :items

  def initialize(first_name, last_name)
    @id = Random.rand(1..100)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    items << item unless items.include?(item)
    item.author(self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [id, first_name, last_name, items]
    }.to_json(*args)
  end

  def self.json_create(object)
    id, first_name, last_name, items = object['a']
    author = new(first_name, last_name)
    author.id = id
    author.items = items
    author
  end
end
