require_relative '../item'
require_relative '../genre'
require_relative '../music_album'
describe 'Item tests' do
  item = Item.new(555, '2020-10-20', archived: false)
  it 'should initialize Item object' do
    expect(item).to be_an_instance_of(Item)
    expect(item.id).to eql(555)
    expect(item.publish_date).to eql('2020-10-20')
    expect(item.archived).to eql(false)
  end
  it 'should add music album to genre collection' do
    music_album = MusicAlbum.new(555, '2020-10-20', archived: false, on_spotify: true)
    motivation = Genre.new(333, 'motivation')
    music_album.genre = motivation
    expect(music_album.genre).to eql(motivation)
    expect(motivation.music_albums).to include(music_album)
  end
  it 'move to archive method should return true' do
    item.move_to_archive
    expect(item.archived).to eql(false)
    item.publish_date = '2013-08-10'
    item.move_to_archive
    expect(item.archived).to eql(true)
  end
end
