require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state, :label

  def initialize(id, publish_date, publisher, cover_state, archived: false)
    super(id, publish_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
    @label = nil
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def self.list_books(books)
    books.each do |book|
      label_title = book.label ? book.label.title : 'N/A'
      puts "Book ID: #{book.id}, Title: #{label_title}, Publisher: #{book.publisher}"
    end
  end
end
