class Author
  attr_accessor :id, :first_name, :last_name
  attr_reader :games

  def initialize(id, first_name, last_name)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @games = []
  end

  def add_game(game)
    @games << game unless @games.include?(game)
    game.author = self
  end

  def to_hash
    {
      id: @id,
      first_name: @first_name,
      last_name: @last_name,
      games: @games.map(&:to_hash)
    }
  end
end
