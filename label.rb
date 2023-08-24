require_relative 'item'

class Label
  attr_accessor :title, :color
  attr_reader :books

  def initialize(title, color)
    @title = title
    @color = color
    @books = []
  end

  def add_book(book)
    @books.push(book)
    book.label = self
  end

  def to_hash
    {
      title: @title,
      color: @color,
      books: @books.map(&:to_hash)
    }
  end
end
