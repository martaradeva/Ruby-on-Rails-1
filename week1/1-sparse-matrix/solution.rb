class Array

# First, take each row of the matrix, flatten each element and strip it from starting/ending nils
# Then, until the matrix-length is 1, we put the 2nd element in the first
# put - for each available slot in the matrix check if our element fits - if so, we write it down. 

  # def compress # + unit test
  #   new_array =map { |row| row.serialize_elements.strip }
  # end

  def format # + unit test
    map { |row| row.serialize_elements.strip }
  end

  def serialize_elements # + unit test
    each_with_index.map { |element, index| [index, element] if element }
  end

  def strip # + unit test
     drop_while{ |elem| !elem }.reverse
    .drop_while{ |elem| !elem }.reverse
  end

  def increment(integer) # + unit test
    [nil] * integer + self
  end

  def write(second)
    if fits?(second) 
      then each_with_index.map { |element, index| element || second[index] }
      else return false
    end
  end

  def fits?(other) # + unit test
    each_with_index { |element, index| if element and other[index] then return false end }
    true
  end

  # def ^(other)
  #   other ? false : true
  # end
end
