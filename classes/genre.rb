require_relative './item'

class Genre
  attr_accessor :name, :items
  attr_reader :id

  def initialize(name, id = Random.rand(1..100))
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    items << item unless items.include? item
    item.genre = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'name' => @name
    }.to_json(*args)
  end

  def self.json_create(object)
    new(
      object['id'],
      object['name']
    )
  end
end
