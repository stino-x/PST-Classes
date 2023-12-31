require_relative 'nameable' # Include the Nameable module

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(name: 'Unknown', age: 0, parent_permission: true)
    super()
    @name = name
    @id = rand(1..1000)
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  private

  def of_age?
    @age >= 18
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.book = self
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end
end
