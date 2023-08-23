require_relative 'book'
require_relative 'label'

class ConsoleApp
  def initialize
    @books = []
    @labels = []
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

    book = Book.new(id, publish_date, publisher, cover_state)
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
