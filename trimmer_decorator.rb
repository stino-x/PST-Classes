require_relative 'decorator' # Include the Decorator class

class TrimmerDecorator < Decorator
  def correct_name
    name = @nameable.correct_name
    name.length <= 10 ? name : name[0, 10]
  end
end
