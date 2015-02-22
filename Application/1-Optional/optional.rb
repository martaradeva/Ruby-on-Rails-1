# Credit where credit's due, this solution relies heavily on Katya Goranova's solution to this FMI challenge (http://fmi.ruby.bg/challenges/7). 
# Kate, I owe you a beer.

class Optional < BasicObject

  def initialize(argument)
    @argument = argument
  end

  def value
    @argument
  end

  def method_missing(name, *args, &block)
    return ::Object::Optional.new(nil) if @argument == nil
    ::Object::Optional.new( @argument.send(name, *args, &block))
  end
end
