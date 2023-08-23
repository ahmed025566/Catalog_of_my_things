require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(id, publish_date, archived: false, on_spotify: false)
    super(id, publish_date, archived: archived)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super() and @on_spotify
  end
end
