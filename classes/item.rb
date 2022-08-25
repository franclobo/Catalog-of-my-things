class Item
  attr_accessor :publish_date, :label, :genre, :author
  attr_reader :id, :archived

  def initialize(publish_date, label = nil, author = nil, genre = nil, archived: true)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @label = label
    @author = author
    @genre = genre
    @archived = archived
  end

  def move_to_archive
    @archived = true if can_be_archive?
  end

  private

  def can_be_archive?
    Time.new.year - publish_date > 10
  end
end
