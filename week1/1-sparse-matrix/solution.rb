class Array

  def compress
    # you can do this with map later
    output = []
    self.each do |row|
      output << row.serialize_elements.strip 
    end
    output
  end

# First, take each row of the matrix, flatten each element and strip it from starting/ending nils
# Then, until the matrix-length is 1, we put the 2nd element in the first
# put - for each available slot in the matrix check if our element fits - if so, we write it down. 

  def serialize_elements
    # you can do this with map later
    # output = []
    # self.each_with_index do |elem, index|
    #   if elem then output << [index, elem]
    #   else output << nil
    #   end
    # end
    # output
    self.each_with_index.map { |element, index| [index, element] if element }
  end

  def strip
    self.drop_while{ |elem| !elem }.reverse
        .drop_while{ |elem| !elem }.reverse
  end
end
