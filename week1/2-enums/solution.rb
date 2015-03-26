module Enums
extend Enumerable

  def each
    # def each here
  end

  def to_a
    # def to_a here
  end

  def self.map(name, to: values)
    # def map here 
    # generate accessor (??) for name -> returns values hash/enumerator
    # generate methods for each value returning its namespaced symbol, e.g. {direction: :north}
  end
end
