require_relative 'item'
require_relative 'author'
require_relative 'genre'

class Book < Item
  attr_accessor :publisher, :cover_state, :author, :genre
  attr_reader :label

  def initialize(id, publish_date, publisher, cover_state, label: nil, author: nil, genre: nil, archived: false)
    super(id, publish_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
    @label = label
    @author = author
    @genre = genre
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def self.list_books(books)
    books.each do |book|
      author_name = book.author ? "#{book.author.first_name} #{book.author.last_name}" : 'N/A'
      genre_name = book.genre ? book.genre.name : 'N/A'
      label_title = book.label ? book.label.title : 'N/A'
      puts "Book ID: #{book.id}, Title: #{label_title}, Publisher: #{book.publisher}, Author: #{author_name}, Genre: #{genre_name}"
    end
  end

  def to_hash
    {
      id: @id,
      publish_date: @publish_date,
      publisher: @publisher,
      cover_state: @cover_state,
      author: @author&.to_hash,
      genre: @genre&.to_hash,
      label: @label&.to_hash
    }
  end
end
