require_relative './item'

class MussicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, publish_date, _id = Ramdon.rand(1..100))
    super(publish_date)
    @on_spotify = on_spotify
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name, 'props' => [@id, @genre, @on_spotify, @publish_date, @label, @author]
    }.to_json(*args)
  end

  def self.json_create(object)
    { id: object['props'][0], genre: object['props'][1], on_spotify: object['props'][2],
      publish_date: object['props'][3], label: object['props'][4], author: object['props'][5] }
  end

  def can_be_archive?
    super && @on_spotify ? true : false
  end
end
