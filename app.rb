require_relative 'music_album'
require_relative 'genre'
require_relative 'book'
require_relative 'label'

class App
  def initialize
    @music_albums = []
    @genres = []
    @books = []
    @labels = []
  end

  def create_music_album(id, publish_date, archived, on_spotify)
    @music_albums.push(MusicAlbum.new(id, publish_date, archived: archived, on_spotify: on_spotify))
  end

  def create_genre(id, name)
    @genres.push(Genre.new(id, name))
  end

  def list_all_music_albums
    @music_albums.each_with_index do |music_album, idx|
      puts "#{idx}) id: #{music_album.id}, publish_date: #{music_album.publish_date}, archived:
      #{music_album.archived}, on_spotify: #{music_album.on_spotify}"
    end
  end

  def list_all_geners
    @genres.each_with_index do |genre, idx|
      puts "#{idx}) id: #{genre.id}, name: #{genre.name}"
    end
  end

  def validate_date(date_string)
    pattern = /\d{4}-\d{2}-\d{2}/
    match = pattern.match(date_string)
    !match
  end

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

  def create_book(id, publish_date, publisher, cover_state, archived)
    @books.push(Book.new(id, publish_date, publisher, cover_state, archived: archived))
  end

  def create_label(title, color)
    @labels.push(Label.new(title, color))
  end

  def list_all_books
    @books.each_with_index do |book, idx|
      puts "#{idx}) id: #{book.id}, publish_date: #{book.publish_date}, archived:
      #{book.archived}, published: #{book.publisher}, cover_state: #{book.cover_state}"
    end
  end

  def list_all_labels
    @labels.each_with_index do |label, idx|
      puts "#{idx}) title: #{label.title}, color: #{label.color}"
    end
  end

  def assign_label
    puts 'want to assign to an exsisting label [1] or create a new one [2]'
    choice = gets.chomp.to_i
    case choice
    when 1
      puts 'Please select a gerne'
      list_all_labels
      choice = gets.chomp.to_i
      @labels[choice].add_label(@books[@books.length - 1])
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
end
