require_relative 'app'

def show_options
  puts "\nPlease choose an option by entering a number:"
  puts '1 - Create music album'
  puts '2 - list all music albums'
  puts '3 - list all genres'
  puts '4 - Create book'
  puts '5 - list all books'
  puts '6 - list all labels'
  puts '7 - Exit'
end

class Main
  app = App.new
  exit = false
  until exit
    show_options
    option = gets.chomp
    options = {
      '1' => app.method(:init_music_album),
      '2' => app.method(:list_all_music_albums),
      '3' => app.method(:list_all_geners),
      '4' => app.method(:init_book),
      '5' => app.method(:list_all_books),
      '6' => app.method(:list_all_labels),
      '7' => lambda {
        puts 'Thank you for using this app!'
        exit = true
      }
    }
    options[option].call
  end
end

main = Main.new
main
