require 'json'
require './music_album'
require './book'
require './game'
require './genre'
require './label'
require './author'

class Loader
  def initialize
    load_data
  end

  attr_reader :books, :music_albums, :games, :labels, :genres, :authors

  def load_data
    @books = load_books
    @music_albums = load_music_albums
    @games = load_games
    @labels = load_labels
    @genres = load_genres
    @authors = load_authors
  end

  def load_books
    return [] unless File.exist?('storage/books.json')

    books_json = File.read('storage/books.json')
    return [] if books_json.empty?

    books_data = JSON.parse(books_json)
    books_data.map do |data|
      Book.new(data['id'], data['publish_date'], data['publisher'], data['cover_state'], archived: data['archived'])
    end
  end

  def load_music_albums
    return [] unless File.exist?('storage/music_albums.json')

    music_albums_json = File.read('storage/music_albums.json')
    return [] if music_albums_json.empty?

    music_albums_data = JSON.parse(music_albums_json)
    music_albums_data.map do |data|
      MusicAlbum.new(data['id'], data['publish_data'], archived: data['archived'], on_spotify: data['on_spotify'])
    end
  end

  def load_games
    return [] unless File.exist?('storage/games.json')

    games_json = File.read('storage/games.json')
    return [] if games_json.empty?

    games_data = JSON.parse(games_json)
    games_data.map do |data|
      Game.new(data['id'], data['publish_date'], data['multiplayer'], data['last_played_at'])
    end
  end

  def load_labels
    return [] unless File.exist?('storage/labels.json')

    labels_json = File.read('storage/labels.json')
    return [] if labels_json.empty?

    labels_data = JSON.parse(labels_json)
    labels_data.map do |data|
      Label.new(data['title'], data['color'])
    end
  end

  def load_genres
    return [] unless File.exist?('storage/genres.json')

    genres_json = File.read('storage/genres.json')
    return [] if genres_json.empty?

    genres_data = JSON.parse(genres_json)
    genres_data.map do |data|
      Genre.new(data['id'], data['name'])
    end
  end

  def load_authors
    return [] unless File.exist?('storage/authors.json')

    authors_json = File.read('storage/authors.json')
    return [] if authors_json.empty?

    authors_data = JSON.parse(authors_json)
    authors_data.map do |data|
      Author.new(data['id'], data['first_name'], data['last_name'])
    end
  end
end
