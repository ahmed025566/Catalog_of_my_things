require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(id, publish_date, multiplayer, last_played_at, archived: false)
    super(id, publish_date, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def to_hash
    {
      id: @id,
      publish_date: @publish_date,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at,
      archived: @archived
    }
  end

  def can_be_archived?
    super && years_since_last_played > 2
  end

  private

  def years_since_last_played
    (Date.today - Date.parse(@last_played_at)).to_i / 365
  end
end
