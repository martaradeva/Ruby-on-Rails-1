class Array
  def compress
    format.ouroboros
  end

  def ouroboros
    while length > 1
      self[0] = self[0].increment_check_and_write(self[1])
      delete_at(1)
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
    drop_while(&:!).reverse
      .drop_while(&:!).reverse
  end

  def increment(integer) # + unit test
    [nil] * integer + self
  end

  def increment_check_and_write(other)
    each do
      other = other.increment(1)
      return write(other) if self.fits?(other)
    end
    self + other.strip
  end

  def write(second) # + unit test
    inflate(second)
      .zip(second)
      .each.map { |a, b| a || b }
  end

  def inflate(second) # + unit test
    if length < second.length
      integer = second.length - length
      reverse.increment(integer).reverse
    else self
    end
  end

  def fits?(other) # + unit test
    each_with_index { |element, index| return false if element && other[index] }
    true
  end
end
