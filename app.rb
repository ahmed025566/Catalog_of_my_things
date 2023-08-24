require_relative 'music_album'
require_relative 'genre'
require_relative 'book'
require_relative 'label'
require_relative 'game'
require_relative 'author'
require_relative 'creator_module'
require 'json'

class App
  def initialize(music_albums, books, games, labels, genres, authors)
    @music_albums = music_albums
    @genres = genres
    @books = books
    @labels = labels
    @games = games
    @authors = authors
  end

  include Create

  def assign_genre
    puts 'want to assign to an exsisting genre [1] or create a new one [2]'
    choice = gets.chomp.to_i
    case choice
    when 1
      puts 'Please select a gerne'
      list_all_geners
      choice = gets.chomp.to_i
      @genres[choice].add_music_album(@music_albums[@music_albums.length - 1])
      puts 'music album created successfully'
    when 2
      puts 'ID: '
      id = gets.chomp
      puts 'name: '
      name = gets.chomp
      create_genre(id, name)
      @genres[@genres.length - 1].add_music_album(@music_albums[@music_albums.length - 1])
      puts 'music album created successfully'
    end
  end

  def init_music_album
    puts 'Id: '
    id = gets.chomp.to_i
    puts 'publish Date: YYYY-MM-DD'
    publish_date = gets.chomp
    validate = validate_date(publish_date)
    while validate
      puts 'please enter the publish date like that YYYY-MM-DD'
      publish_date = gets.chomp
      validate = validate_date(publish_date)
    end
    puts 'archvied? [Y/N]'
    archived = gets.chomp.downcase == 'y'
    puts 'on spotify? [Y/N]'
    on_spotify = gets.chomp.downcase == 'y'
    create_music_album(id, publish_date, archived, on_spotify)
    assign_genre
  end

  def assign_label
    puts 'want to assign to an exsisting label [1] or create a new one [2]'
    choice = gets.chomp.to_i
    case choice
    when 1
      puts 'Please select a gerne'
      list_all_labels
      choice = gets.chomp.to_i
      @labels[choice].add_book(@books[@books.length - 1])
      puts 'book created successfully'
    when 2
      puts 'Tilte: '
      title = gets.chomp
      puts 'Color: '
      color = gets.chomp
      create_label(title, color)
      @labels[@labels.length - 1].add_book(@books[@books.length - 1])
      puts 'music album created successfully'
    end
  end

  def init_book
    puts 'Id: '
    id = gets.chomp.to_i
    puts 'publish Date: YYYY-MM-DD'
    publish_date = gets.chomp
    validate = validate_date(publish_date)
    while validate
      puts 'please enter the publish date like that YYYY-MM-DD'
      publish_date = gets.chomp
      validate = validate_date(publish_date)
    end
    puts 'publisher: '
    publisher = gets.chomp
    puts 'cover_state'
    cover_state = gets.chomp
    puts 'archvied? [Y/N]'
    archived = gets.chomp.downcase == 'y'
    create_book(id, publish_date, publisher, cover_state, archived)
    assign_label
  end

  def assign_author
    puts 'want to assign to an exsisting author [1] or create a new one [2]'
    choice = gets.chomp.to_i
    case choice
    when 1
      puts 'Please select an author'
      list_all_authors
      choice = gets.chomp.to_i
      @authors[choice].add_game(@games[@games.length - 1])
      puts 'game created successfully'
    when 2
      puts 'ID: '
      id = gets.chomp
      puts 'first_name: '
      first_name = gets.chomp
      puts 'last_name: '
      last_name = gets.chomp
      create_author(id, first_name, last_name)
      @authors[@authors.length - 1].add_game(@games[@games.length - 1])
      puts 'game album created successfully'
    end
  end

  def init_game
    puts 'Id: '
    id = gets.chomp.to_i
    puts 'publish Date: YYYY-MM-DD'
    publish_date = gets.chomp
    validate = validate_date(publish_date)
    while validate
      puts 'please enter the publish date like that YYYY-MM-DD'
      publish_date = gets.chomp
      validate = validate_date(publish_date)
    end
    puts 'multiplayer: '
    multiplayer = gets.chomp
    puts 'last_played_at'
    last_played_at = gets.chomp
    puts 'archvied? [Y/N]'
    archived = gets.chomp.downcase == 'y'
    create_game(id, publish_date, multiplayer, last_played_at, archived)
    assign_author
  end

  def save_date
    music_albums_json = @music_albums.map(&:to_hash)
    books_json = @books.map(&:to_hash)
    games_json = @games.map(&:to_hash)
    genres_json = @genres.map(&:to_hash)
    labels_json = @labels.map(&:to_hash)
    authors_json = @authors.map(&:to_hash)

    File.write('storage/music_albums.json', JSON.generate(music_albums_json))
    File.write('storage/books.json', JSON.generate(books_json))
    File.write('storage/games.json', JSON.generate(games_json))
    File.write('storage/genres.json', JSON.generate(genres_json))
    File.write('storage/labels.json', JSON.generate(labels_json))
    File.write('storage/authors.json', JSON.generate(authors_json))
  end
end
