require_relative './item'

class MussicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, publish_date, label = nil, author = nil, genre = nil)
    super(publish_date, label, author, genre)
    @on_spotify = on_spotify
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'genre' => @genre,
      'on_spotify' => @on_spotify,
      'publish_date' => @publish_date,
      'label' => @label,
      'author' => @author
    }.to_json(*args)
  end

  def self.json_create(object)
    new(
      object['id'],
      object['genre'],
      object['on_spotify'],
      object['publish_date'],
      object['label'],
      object['author']
    )
  end

  def can_be_archive?
    super && @on_spotify ? true : false
  end
end
