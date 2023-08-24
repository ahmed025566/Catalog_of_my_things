require_relative '../genre'
require_relative '../music_album'

describe 'music album tests' do
  music_album = MusicAlbum.new(555, '2020-10-20', archived: false, on_spotify: false)
  it 'should initialize genre object' do
    expect(music_album).to be_an_instance_of(MusicAlbum)
    expect(music_album.id).to eql(555)
    expect(music_album.publish_date).to eql('2020-10-20')
    expect(music_album.archived).to eql(false)
    expect(music_album.on_spotify).to eql(false)
  end

  it 'should add music album to the collection genre' do
    genre = Genre.new(333, 'motivation')
    music_album.genre = genre
    expect(genre.music_albums).to include(music_album)
    expect(music_album.genre).to eql(genre)
  end

  it 'can be archived method tests' do
    expect(music_album.archived).to eql(false)
    music_album.publish_date = '2012-10-10'
    music_album.move_to_archive
    expect(music_album.archived).to eql(false)
    music_album.on_spotify = true
    music_album.move_to_archive
    expect(music_album.archived).to eql(true)
  end
end
