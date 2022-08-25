require 'json'
require_relative './book'
require_relative './label'
require_relative './game'
require_relative './author'
require_relative './music_album'
require_relative './genre'

class App
  attr_accessor :books, :music_albums, :games, :labels, :genres, :authors

  def initialize
    @books = []
    @music_albums = []
    @games = []
    @labels = []
    @genres = []
    @authors = []
  end

  def list_books
    @books.each do |book|
      puts "Book Title: #{book.label.title}"
    end
  end

  def list_labels
    @labels.each do |label|
      puts "[Label]: #{label.title} (#{label.color})"
    end
  end

  def list_music_albums
    @music_albums.each do |album|
      puts "Album Name: #{album.label.title})"
    end
  end

  def list_authors
    @authors.each do |author|
      puts "[Author]: #{author.first_name} #{author.last_name}"
    end
  end

  def list_games
    @games.each do |game|
      puts "Game name: #{game.label.title} Genre: #{game.genre.name}"
    end
  end

  def list_genres
    @genres.each do |genre|
      puts "[Genre]: #{genre.name}"
    end
  end

  # rubocop:disable Metrics/MethodLength
  def create_book
    puts 'Book name:'
    label = Label.new(gets.chomp)
    puts 'Publisher:'
    publisher = gets.chomp
    puts 'Cover state [good/bad]:'
    cover_state = gets.chomp
    puts 'Year of publish:'
    publish_date = gets.chomp
    puts 'Author`s full name [first and last name]:'
    author_value = gets.chomp
    arr = author_value.split
    author = Author.new(arr[0], arr[1])
    puts 'Genre (e.g. Comedy, Thriller):'
    genre = Genre.new(gets.chomp)
    book = Book.new(publisher, cover_state, publish_date, label, author, genre)
    author.add_item(book)
    label.add_item(book)
    genre.add_item(book)
    @authors.push(author)
    @labels.push(label)
    @genres.push(genre)
    @books.push(book)
    puts 'Book added successfully'
  end

  def create_music_album
    puts 'Album name:'
    label = Label.new(gets.chomp)
    puts 'The albun is on spotify [Y/N]:'
    on_spotify = gets.chomp
    puts 'Year of publish:'
    publish_date = gets.chomp
    puts 'Author`s full name [first and last name]:'
    author_value = gets.chomp
    arr = author_value.split
    author = Author.new(arr[0], arr[1])
    puts 'Genre (e.g. Pop, Rock):'
    genre = Genre.new(gets.chomp)
    music_album = MussicAlbum.new(on_spotify, publish_date, label, author, genre)
    author.add_item(music_album)
    label.add_item(music_album)
    genre.add_item(music_album)
    @authors.push(author)
    @labels.push(label)
    @genres.push(genre)
    @music_albums.push(music_album)
    puts 'Album added successfully'
  end

  def create_game
    puts 'Game name:'
    label = Label.new(gets.chomp)
    puts 'It`s multiplayer [Y/N]:'
    multiplayer = gets.chomp
    puts 'Last time that you played [Year]:'
    last_played_at = gets.chomp
    puts 'Year of publish:'
    publish_date = gets.chomp
    puts 'Author`s full name [First and Last name]:'
    author_value = gets.chomp
    arr = author_value.split
    author = Author.new(arr[0], arr[1])
    puts 'Genre (e.g. Shooter, MOBA):'
    genre = Genre.new(gets.chomp)
    game = Game.new(multiplayer, last_played_at, publish_date, label, author, genre)
    author.add_item(game)
    label.add_item(game)
    genre.add_item(game)
    @authors.push(author)
    @labels.push(label)
    @genres.push(genre)
    @games.push(game)
    puts 'Game added successfully'
  end
  # rubocop:enable Metrics/MethodLength
end
