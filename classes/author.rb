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
    items << item unless items.include? item
    item.author = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'first_name' => first_name,
      'last_name' => last_name
    }.to_json(*args)
  end

  def self.json_create(object)
    new(
      object['first_name'],
      object['last_name']
    )
  end
end
