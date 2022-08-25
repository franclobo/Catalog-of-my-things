require_relative './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'publish_date' => @publish_date,
      'last_played' => @last_played_at,
      'multiplayer' => @multiplayer,
      'archived' => @archived,
      'genre' => @genre&.id,
      'label' => label&.id,
      'author' => author&.id
    }.to_json(*args)
  end

  def self.json_create(object)
    new(
      object['id'],
      object['publish_date'],
      object['last_played'],
      object['multiplayer'],
      object['archived'],
      object['genre'],
      object['label'],
      object['author']
    )
  end
end
  end

  private

  def can_be_archive?
    super || Time.new.year - last_played_at > 2
  end
end
