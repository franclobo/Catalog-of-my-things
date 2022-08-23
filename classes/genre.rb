class Genre
  attr_accessor :name, :items

  def initialize(name, id = Random.rand(1..100))
    @id = id
    @name = name
    @items = []
  end

end
