require 'minitest/autorun'
require 'minitest/rg'

require_relative 'solution'

class SolutionTest < Minitest::Test

  describe "compress" do
    before do
      @source = [[1, nil, nil, nil],
                 [nil, 2, 5, nil],
                 [6, nil, nil, 7],
                 [nil, 3, nil, 4]]
      @outcome = [[0, 1], [1, 2], [2, 5], [0, 6], nil, [1, 3], [3, 7], [3, 4]]
    end

    describe "when called with sample area" do
      it "returns correct compressed value" do
        @source.compress.must_equal @outcome
      end
    end
  end
end
