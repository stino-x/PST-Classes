class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rentals(date, person)
    rental = Rental.new(date, self, person)
    @rentals << rental
  end
end
