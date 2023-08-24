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

  def self.list_labels(labels)
    labels.each do |label|
      puts "Label ID: #{label.id}, Title: #{label.title}"
    end
  end

  def to_hash
    {
      id: @id,
      title: @title,
      color: @color
    }
  end
end
