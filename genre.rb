class Genre
  attr_accessor :name, :id, :music_albums

  def initialize(id, name)
    @id = id
    @name = name
    @music_albums = []
  end

  def add_music_album(music_album)
    @music_albums.push(music_album)
    music_album.genre = self
  end

  def to_hash
    {
      id: @id,
      name: @name,
      music_albums: @music_albums.map(&:to_hash)
    }
  end
end
