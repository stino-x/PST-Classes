require_relative 'book'
require_relative 'student'
require_relative 'rental'
require_relative 'teacher'

class App
  def initialize(parent)
    @parent = parent
    @books = []
    @rentals = []
    @people = []
  end

  def list_of_people
    if @people.empty?
      puts 'List Of People is empty'
    else
      puts 'List of People:'
      @people.each do |person|
        puts "[#{person.class}] NAME: #{person.name}, ID: #{person.id}, AGE: #{person.age}"
      end
    end
    @parent.show_menu
  end

  def list_of_books
    if @books.empty?
      puts 'No Book In The List.'
    else
      puts 'List of Books available.'
      @books.each { |book| puts "Title: #{book.title} By #{book.author}" }
    end
    @parent.show_menu
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    @people.push(Student.new(age, name, parent_permission: parent_permission))
    puts
    puts 'Student is successfully created'
  end

  def create_person
    puts 'Do you want to create a Student(1) or Teacher(2)? [ENTER NUMBER]:'
    person_input = gets.chomp
    case person_input
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Please add a valid input!'
    end
    @parent.show_menu
  end

  def create_teacher
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @people.push(Teacher.new(specialization, age, name))
    puts
    puts 'Teacher is successfully created'
    @parent.show_menu
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts 'Book created successfully'
    @parent.show_menu
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: '#{book.title}', Author: #{book.author}" }

    puts 'Enter the number of the book:'
    book_num = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    puts 'Enter the number of the person:'
    person_num = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    @rentals.push(Rental.new(date, @books[book_num], @people[person_num]))
    puts 'Rental created successfully'
    @parent.show_menu
  end

  def list_of_rentals
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals:'
    rentals_found = @rentals.select { |rental| rental.person.id == id }
    if rentals_found.empty?
      puts 'No rentals found for the given person ID.'
    else
      rentals_found.each do |rental|
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end

    @parent.show_menu
  end

  def exit
    puts 'Thank you and see you later!'
  end
end
