module Create
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

  def validate_date(date_string)
    pattern = /\d{4}-\d{2}-\d{2}/
    match = pattern.match(date_string)
    !match
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

  def list_all_geners
    @genres.each_with_index do |genre, idx|
      puts "#{idx}) id: #{genre.id}, name: #{genre.name}"
    end
  end

  def create_game(id, publish_date, multiplayer, last_played_at, archived)
    @games.push(Game.new(id, publish_date, multiplayer, last_played_at, archived: archived))
  end

  def create_author(id, first_name, last_name)
    @authors.push(Author.new(id, first_name, last_name))
  end

  def list_all_games
    @games.each_with_index do |game, idx|
      puts "#{idx}) id: #{game.id}, publish_date: #{game.publish_date}, multiplayer:
      #{game.multiplayer}, last_played_at: #{game.last_played_at}, archived: #{game.archived}"
    end
  end

  def list_all_authors
    @authors.each_with_index do |author, idx|
      puts "#{idx}) id: #{author.id}, first_name: #{author.first_name}, last_name: #{author.last_name}"
    end
  end
end
