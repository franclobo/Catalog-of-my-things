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
      puts "[Label] : #{label.title} (#{label.color})"
    end
  end

  def list_music_albums
    @music_albums.each do |album|
      puts "[Title] : #{album.label.title} - [Author] : #{album.author.first_name} ([Date] : #{album.publish_date})"
    end
  end

  def list_authors
    @authors.each do |author|
      puts "[Author] : #{author.first_name} #{author.last_name}"
    end
  end

  def list_games
    @games.each do |game|
      puts "Title: #{game.label.title}  Multiplayer: #{game.multiplayer} Genre: #{game.genre.name}"
    end
  end

  def list_genres
    @genres.each do |genre|
      puts "[Genre] : #{genre.name}"
    end
  end

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
end
