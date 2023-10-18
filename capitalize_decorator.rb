require_relative 'decorator' # Include the Decorator class

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
