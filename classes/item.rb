class item
  attr_accessor :publish_date
  attr_reader :id, :genre, :author, :label, :archived

  def initialize (id, publish_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def genre=(genre)
    @genre = genre
  end

  def author=(author)
    @author = author
  end

  def label=(label)
    @label = label
  end

  def can_be_archive?
    @publish_date.parse > @publish_date.parse.prev_year(10)
  end

  def move_to_archive   
  end
end
