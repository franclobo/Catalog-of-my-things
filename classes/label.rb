require_relative './item'

class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color)
    @id = Random.rand(1..100)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    items << item unless items.include?(item)
    item.label(self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'title' => @title,
      'color' => @color
    }.to_json(*args)
  end

  def self.json_create(label)
    new(
      label['id'],
      label['title'],
      label['color']
    )
  end
end
