require_relative 'item'

def display_options
  puts "Options:"
  puts "1. Create Item"
  puts "2. Archive Items"
  puts "3. Quit"
end

def create_item
  print "Enter publication date (YYYY-MM-DD): "
  pub_date = gets.chomp
  item = Item.new(pub_date)
  puts "Item created with ID: #{item.id}"
end

def archive_items(items)
  items.each do |item|
    if item.can_be_archived?
      item.move_to_archive
      puts "Item with ID #{item.id} has been archived."
    else
      puts "Item with ID #{item.id} cannot be archived yet."
    end
  end
end

genres = [Genre.new, Genre.new]
authors = [Author.new, Author.new]
sources = [Source.new, Source.new]
labels = [Label.new, Label.new]

items = []

loop do
  display_options
  choice = gets.chomp.to_i

  case choice
  when 1
    create_item
  when 2
    archive_items(items)
  when 3
    puts "Goodbye!"
    break
  else
    puts "Invalid choice. Please choose a valid option."
  end
end
