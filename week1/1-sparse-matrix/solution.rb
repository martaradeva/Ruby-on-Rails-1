class Array

  def compress
    # new_array = apply_by_rows compress_separate_elements
    new_array = []
    self.each do |row|
      new_array << row.compress_separate_elements
    end
    p new_array

    # [[0, 1], [1, 2], [2, 5], [0, 6], nil, [1, 3], [3, 7], [3, 4]]
  end

  def apply_by_rows &block
    # self.each do |row|
    #   row.send
    # end
      # and you can do this with yield
  end

  def new_method
    #for each empty space in self 
    #check availability
    #return id if all are available
  end

  def first_empty_space_id
    self.each_with_index do |elem, index|
      return index unless elem
    end
  end

  def write_increment(increment, array)
    if all_available?(increment, array) then # write this in new method
      array.each[0] += increment
      array.each do |index, value|
        self[index]=value
      end
    end
  end

  def all_available?(start_id, array)
    array.each_with_index do |element, index|
      flag = element and self(start_id + index).available?
    end
    if flag ? true : false
    # flag
  end

  def available?(id)
    return true unless self[id]
  end

  def compress_separate_elements
    # you can do this with map later
    output = []
    self.each_with_index do |elem, index|
      if elem then output << [index, elem]
      else output << nil
      end
    end
    output
  end
end
