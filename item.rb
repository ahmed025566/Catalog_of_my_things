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
    genre.music_albums.push(self) unless genre.music_albums.include?(self)
  end

  def author=(author)
    @author = author
    author.games.push(self) unless author.games.include?(self)
  end

  private

  def can_be_archived?
    ((Date.today - Date.parse(@publish_date)) / 365) > 10
  end

  public

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
