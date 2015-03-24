class Array

# First, take each row of the matrix, flatten each element and strip it from starting/ending nils
# Then, until the matrix-length is 1, we put the 2nd element in the first
# put - for each available slot in the matrix check if our element fits - if so, we write it down. 

  def compress
    format.ouroboros
  end

  # def compress # + unit test
  #   new_array = format
  #   while new_array.length > 1 do
  #     new_array[0] = new_array[0].increment_check_and_write(new_array[1])
  #     new_array.delete_at(1)
  #   end
  # end

  def ouroboros
    while length > 1 do
      self[0] = self[0].increment_check_and_write(self[1])
      self.delete_at(1)
    end
    self
  end

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

  def increment_check_and_write(other)
    self.each_with_index do |element, index|
      other.increment(index)
      if self.fits?(other)
      then return write(other)
      end
    end
    self + other.strip
  end

  def write(second) # + unit test
    self.inflate(second)
        .zip(second)
        .each.map { |a, b| a || b }
  end

  def inflate(second)
    if self.length < second.length
    then
      integer = second.length - self.length
      self.reverse.increment(integer).reverse
    else self
    end
  end

  def fits?(other) # + unit test
    each_with_index { |element, index| if element and other[index] then return false end }
    true
  end

end
