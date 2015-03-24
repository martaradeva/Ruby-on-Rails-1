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

  def format
    map { |row| row.serialize_elements.strip }
  end

  def serialize_elements
    each_with_index.map { |element, index| [index, element] if element }
  end

  def strip
    drop_while(&:!).reverse
      .drop_while(&:!).reverse
  end

  def increment(integer)
    [nil] * integer + self
  end

  def increment_check_and_write(other)
    each do
      return write(other) if self.fits?(other)
      other = other.increment(1)
    end
    self + other.strip
  end

  def write(second)
    inflate(second)
      .zip(second)
      .each.map { |a, b| a || b }
  end

  def inflate(second)
    if length < second.length
      integer = second.length - length
      reverse.increment(integer).reverse
    else self
    end
  end

  def fits?(other)
    each_with_index { |element, index| return false if element && other[index] }
    true
  end
end
