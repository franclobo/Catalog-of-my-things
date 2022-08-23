class Item
  attr_accessor :publish_date
  attr_reader :id, :archived

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  attr_writer :author, :label

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def can_be_archive?
    @publish_date.parse > @publish_date.parse.prev_year(10)
  end

  def move_to_archive
    @archived = true if can_be_archive?
  end
end
