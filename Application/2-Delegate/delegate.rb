# delegate.rb

class Module

  def delegate( *methods, to: "")

    methods.each do |method_symbol|
      self.class_eval do
        define_method (method_symbol) { send(to).send(method_symbol) }
      end
    end
  end

end

