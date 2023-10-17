class Person
  attr_accessor :name
  attr_reader :id
  attr_writer :age

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