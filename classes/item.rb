# rubocop: disable Style/TrivialAccessors
class Item
  attr_accessor :publish_date
  attr_reader :id, :archived

  def initialize(publish_date, archived: false)
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

  def move_to_archive
    @archived = true if can_be_archive?
  end

  private

  def can_be_archive?
    @publish_date.parse > @publish_date.parse.prev_year(10)
  end
end
# rubocop: enable Style/TrivialAccessors
