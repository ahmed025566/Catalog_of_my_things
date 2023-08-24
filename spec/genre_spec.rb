require_relative '../genre'
require_relative '../music_album'

describe 'Genre tests' do
  genre = Genre.new(333, 'motivation')
  it 'should initialize genre object' do
    expect(genre).to be_an_instance_of(Genre)
    expect(genre.id).to eql(333)
    expect(genre.name).to eql('motivation')
    expect(genre.music_albums).to be_empty
  end

  it 'should add music album to the collection genre' do
    music_album = MusicAlbum.new(555, '2020-10-20', archived: false, on_spotify: true)
    genre.add_music_album(music_album)
    expect(genre.music_albums).to include(music_album)
    expect(music_album.genre).to eql(genre)
  end
end
