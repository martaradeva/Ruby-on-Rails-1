require 'minitest/autorun'

require_relative 'solution'

class SolutionTest < Minitest::Test

  def setup
    @source = [[1, nil, nil, nil],
                  [nil, 2, 5, nil],
                  [6, nil, nil, 7],
                  [nil, 3, nil, 4]]
    @outcome = [[0, 1], [1, 2], [2, 5], [0, 6], nil, [1, 3], [3, 7], [3, 4]]
  end

  def compress_method_working
    assert_equal @outcome, @source.compress
  end
end
