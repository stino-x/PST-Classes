require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(specialization: 'none', name: 'Unknown', age: 0, parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true # Teachers can always use services
  end
end
