class Genre
  attr_accessor :name, :id
  attr_reader :music_albums

  def initialize(id, name)
    @id = id
    @name = name
    @music_albums = []
  end

  def add_music_album(music_album)
    @music_albums.push(music_album)
    music_album.genre = self
  end
end
