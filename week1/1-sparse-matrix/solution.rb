class Array

  def compress
    format.ouroboros
  end

  def ouroboros
    while length > 1 do
      self[0] = self[0].increment_check_and_write(self[1])
      self.delete_at(1)
    end
    self[0]
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
    self.each do |element|
      other = other.increment(1)
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

  def inflate(second) # + unit test
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
