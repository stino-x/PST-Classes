class Person
  attr_reader :id, :name
  attr_accessor :age # Combines getter and setter for age

  def initialize(name: 'Unknown', age: 0, parent_permission: true)
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end
end
