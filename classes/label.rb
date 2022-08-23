class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color)
    @id = Random.rand(1..100)
    @title = title
    @color = color
    @items = []
  end
end
