require_relative './item'
require_relative './label'

class Book < Item
  attr_reader :id
  attr_accessor :publisher, :cover_state

  # rubocop:disable Metrics/ParameterLists
  def initialize(
    publisher, cover_state, publish_date, label = nil, author = nil, genre = nil
  )
    super(label, publish_date, author, genre)
    @publisher = publisher
    @cover_state = cover_state
  end

  # rubocop:enable Metrics/ParameterList
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'title' => @label.title,
      'publisher' => @publisher,
      'cover_state' => @cover_state,
      'publish_date' => @publish_date,
      'author' => @author,
      'genre' => @genre
    }.to_json(*args)
  end

  def self.json_create(book)
    new(
      book['id'],
      Label.new(book['title']),
      book['publisher'],
      book['cover_state'],
      book['publish_date'],
      book['author'],
      book['genre']
    )
  end

  private

  def can_be_archive?
    super || cover_state == 'bad'
  end
end
