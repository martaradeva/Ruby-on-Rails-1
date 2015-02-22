# Credit where credit's due, this solution relies heavily on Katya Goranova's solution to this FMI challenge (http://fmi.ruby.bg/challenges/7). 
# Kate, I owe you a beer.

class Optional < BasicObject
  instance_methods.each { |m| undef_method m unless m =~ /(^__send__$|^object_id$)/ }

  attr_accessor :argument

  def initialize(argument)
    @argument = argument
  end

  def value
    @argument
    # ::Object::Proc.new { |object| object.argument }
  end

  def method_missing(name, *args, &block)
    # puts "pass one"
    #self
    # @argument.send(name, *args, &block)
    ::Object::Optional.new( @argument.send(name, *args, &block))
    # args
    # ::Object::Proc.new { |object| object.send(name, *args, &block) }
  end
end

# class Proxy
#   instance_methods.each { |m| undef_method m unless m =~ /(^__send__$|^object_id$)/ }

#   def method_missing(name, *args, &block)
#     Proc.new { |object| object.send(name, *args, &block) }
#   end

#   def to_proc
#     Proc.new { |object| object }
#   end
# end

# P = Proxy.new