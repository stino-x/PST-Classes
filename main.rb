require_relative 'app'

class Options
  def initialize
    @app = App.new(self)
    puts 'WELCOME TO THE SCHOOL LIBRARY APP!!'
    show_menu
  end

  def show_menu
    puts
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - Create a rental'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - List all people'
    puts '6 - List all rentals for a given person ID'
    puts '7 - Exit'
    puts
    user_choice = gets.chomp
    select_option(user_choice)
  end

  def select_option(user_choice)
    menu = {
      '1' => :list_of_books,
      '2' => :create_rental,
      '3' => :create_person,
      '4' => :create_book,
      '5' => :list_of_people,
      '6' => :list_of_rentals,
      '7' => :exit
    }

    method = menu[user_choice]
    if method.nil?
      puts 'Invalid option, please try again!'
      puts
      show_menu
    else
      @app.send(method)
    end
  end
end

def main
  Options.new
end

main
