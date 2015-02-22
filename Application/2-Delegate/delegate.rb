# delegate.rb
class Module

  def create_method( name, &block )
    p self
    p name
    self.send( :define_method, name, &block )
    # self.class.send( :define_method, name, &block )
    # p self.respond_to? name
    p self.new.respond_to? name
  end

  # def delegate(*methods, to:)
  #   methods.each do |method_symbol|
  #     # define a method
  #     define_method(method_symbol) { "@#{method_symbol}"}
  #   end
  #   # delegate definition
  # end

  def delegate( *methods, to: '')
    methods.each do |method_symbol|
      # p to
      # p method_symbol
      p self
      # create_method( method_symbol ) do |value| instance_variable_set( "#{to}", value) end
      # create_method( method_symbol ) do         instance_variable_get( "#{to}") end
      self.send :define_method, method_symbol do |value| instance_variable_set( "#{to}", value) end
      self.send :define_method, method_symbol do         instance_variable_get( "#{to}") end
      p self.new.respond_to? method_symbol
    end

    #   create_method(method_symbol, to) { |value| 
    #     instance_variable_set( "#{to}", value)
    #   }

    #   create_method( method_symbol, to ) { 
    #   instance_variable_get("#{to}") 
    #   }
    # end
  end
end
