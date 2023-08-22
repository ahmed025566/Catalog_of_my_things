require 'date'
class Item
  attr_accessor :id, :publish_date, :archived
  attr_reader :label, :genre, :author

  def initialize(id, publish_date, archived: false)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def label=(label)
    @label = label
    label.books.push(self) unless label.books.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.music_album.push(self) unless genre.music_album.include?(self)
  end

  def author=(author)
    @author = author
    author.games.push(self) unless author.games.include?(self)
  end

  def can_be_archived?
    puts 'still need some work'
  end
end
