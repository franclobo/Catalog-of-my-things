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
    books.each do |book|
      puts "Title: #{book.label.title}  Author: #{book.author} Genre: #{book.genre}"
    end
  end

  def list_labels
    @labels.each do |label|
      puts "[Label] : #{label.title}"
    end
  end

  def list_music_albums
    @music_albums.each do |album|
      puts "[Title] : #{album.label.title} - [Author] : #{album.author.first_name} ([Date] : #{album.publish_date})"
    end
  end

  def list_authors
    @authors.each do |author|
      puts "[Author] : #{author.first_name}"
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
end
