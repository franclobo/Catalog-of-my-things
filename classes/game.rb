require_relative './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  # rubocop:disable Metrics/ParameterLists
  def initialize(multiplayer, last_played_at, publish_date, label = nil, author = nil, genre = nil)
    super(publish_date, label, author, genre)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  # rubocop:enable Metrics/ParameterLists
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [id, publish_date, last_played_at, multiplayer, archived, genre&.id, label&.id, author&.id]
    }.to_json(*args)
  end

  def self.json_create(object)
    id, publish_date, last_played_at, multiplayer, archived, genre_id, label_id, author_id = object['a']
    game = new(publish_date, last_played_at, multiplayer: multiplayer)
    game.id = id
    game.archived = archived
    game.genre = genre_id
    game.label = label_id
    game.author = author_id
    game
  end

  private

  def can_be_archive?
    super || Time.new.year - last_played_at > 2
  end
end
