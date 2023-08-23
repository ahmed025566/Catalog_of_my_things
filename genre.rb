class Genre
  attr_accessor :items, :name, :id

  def initialize(name)
    @id = rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def to_hash
    {
      id: @id,
      name: @name
    }
  end
end
