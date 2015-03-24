class Array

# First, take each row of the matrix, flatten each element and strip it from starting/ending nils
# Then, until the matrix-length is 1, we put the 2nd element in the first
# put - for each available slot in the matrix check if our element fits - if so, we write it down. 

  def compress
    map { |row| row.serialize_elements.strip }
  end

  def serialize_elements
    each_with_index.map { |element, index| [index, element] if element }
  end

  def strip
     drop_while{ |elem| !elem }.reverse
    .drop_while{ |elem| !elem }.reverse
  end

  def increment(integer)
    [nil] * integer + self
  end

  def write(array)
    if fits?(array) 
      then each_with_index.map { |element, index| element || array[index] }
    end
  end

  def fits?(array)
    each_with_index { |element, index| if element and array[index] then return false end }
    true
  end

  # def ^(other)
  #   other ? false : true
  # end
end
