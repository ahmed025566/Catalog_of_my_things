require_relative 'book'
require_relative 'label'
require_relative 'author'
require_relative 'genre'
require 'json'

class ConsoleApp
  def initialize
    @books = []
    @labels = []
  end

  def save_data_to_json(filename, data)
    File.open(filename, 'w') do |file|
      file.write(JSON.pretty_generate(data))
    end
  end

  def save_all_data
    serialized_books = @books.map(&:to_hash)
    save_data_to_json('books.json', serialized_books)
    save_data_to_json('labels.json', @labels.map(&:to_hash))

    puts 'Data saved to JSON files.'
  end

  def list_books
    Book.list_books(@books)
  end

  def list_labels
    Label.list_labels(@labels)
  end

  def add_book
    puts 'Enter book ID:'
    id = gets.chomp.to_i
    puts 'Enter publish date (YYYY-MM-DD):'
    publish_date = gets.chomp
    puts 'Enter publisher:'
    publisher = gets.chomp
    puts "Enter cover state ('good' or 'bad'):"
    cover_state = gets.chomp

    puts 'Enter author first name:'
    author_first_name = gets.chomp
    puts 'Enter author last name:'
    author_last_name = gets.chomp
    author = Author.new(author_first_name, author_last_name)

    puts 'Enter genre name:'
    genre_name = gets.chomp
    genre = Genre.new(genre_name)

    puts 'Enter label title:'
    label_title = gets.chomp
    puts 'Enter label color:'
    label_color = gets.chomp
    label = Label.new(label_title, label_color)

    book = Book.new(id, publish_date, publisher, cover_state, author: author, genre: genre, label: label)
    @books << book

    puts 'Book added successfully!'
  end

  def start
    loop do
      display_options
      choice = user_choice

      case choice
      when 1
        list_books
      when 2
        list_labels
      when 3
        add_book
      when 4
        save_all_data
        exit_app
        break
      else
        display_invalid_option
      end
    end
  end

  private

  def display_options
    puts '\nOptions:'
    puts '1. List all books'
    puts '2. List all labels'
    puts '3. Add a book'
    puts '4. Quit'
  end

  def user_choice
    print 'Choose an option:'
    gets.chomp.to_i
  end

  def exit_app
    puts 'Goodbye!'
  end

  def display_invalid_option
    puts 'Invalid option. Please choose a valid option.'
  end
end

app = ConsoleApp.new
app.start
