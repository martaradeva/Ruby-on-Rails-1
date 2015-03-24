require 'minitest/autorun'
require 'minitest/rg'

require_relative 'solution'

class SolutionTest < Minitest::Test

  describe "serialize_elements" do
    before do
      @source = [1, nil, nil, nil]

      @outcome = [[0, 1], nil, nil, nil]
    end

    describe "when called" do
      it "returns correct compressed value" do
        @source.serialize_elements.must_equal @outcome
      end
    end
  end

  describe "strip" do
    before do
      @source = [nil, [1,2], nil, [3,4], nil, nil]
      @outcome = [[1,2], nil, [3,4]]
    end

    describe "when called" do
      it "returns correct stripped array" do
        @source.strip.must_equal @outcome
      end
    end
  end

  describe "increment" do
    before do
      @source = [[1,2], nil, [3,4]]
      @multiplier = 3
      @outcome = [nil, nil, nil, [1,2], nil, [3,4]]
    end

    describe "when called" do
      it "returns correct stripped array" do
        @source.increment(@multiplier).must_equal @outcome
      end
    end
  end

  describe "fits?" do
    before do
      @other = [[1,2], nil, [3,4]]
      @source = [nil, nil, nil, [1,2], nil, [3,4]]
      @wrong = [[1,2], nil, nil, [3,4]]
    end

    describe "when called with correct arrays" do
      it "returns true" do
        @source.fits?(@other).must_equal true
      end
    end

    describe "when called with incorrect arrays" do
      it "returns false" do
        @source.fits?(@wrong).must_equal false
      end
    end
  end

  describe "write" do
    before do
      @second = [[1,2], nil, [3,4]]
      @first = [nil, nil, nil, [1,2], nil, [3,4]]
      @outcome = [[1,2], nil, [3,4], [1,2], nil, [3,4]]
    end

    describe "when called with correct arrays" do
      it "writes second into first" do
        @first.write(@second).must_equal @outcome
      end
    end

    describe "when called with a shorter first array" do
      it "is reversible" do
        @second.write(@first).must_equal @outcome
      end
    end
  end

  describe "inflate" do
    before do
      @second = [[1,2], nil, [3,4]]
      @first = [nil, nil, nil, [1,2], nil, [3,4]]
      @outcome = [[1,2], nil, [3,4], nil, nil, nil]
    end

    describe "it works" do
      it "inflates shorter array" do
        @second.inflate(@first).must_equal @outcome
      end
    end
  end

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

  describe "format" do
    before do
      @source = [[1, nil, nil, nil],
                 [nil, 2, 5, nil],
                 [6, nil, nil, 7],
                 [nil, 3, nil, 4]]
      @outcome = [[[0,1]],
                 [[1,2], [2,5]],
                 [[0,6], nil, nil, [3,7]],
                 [[1,3], nil, [3,4]]]
    end

    describe "when called with sample area" do
      it "returns correctly formatted value" do
        @source.format.must_equal @outcome
      end
    end
  end

  describe "increment_check_and_write" do
    before do
      @first = [[0,0], nil, nil, [1,2], nil, [3,4]]
      @second = [[1,2], nil, [3,4]]
      @outcome = [[0,0], nil, [1,2], [1,2], [3,4], [3,4]]
    end

    describe "it increments, checks and writes" do
      it "correctly" do
        @first.increment_check_and_write(@second).must_equal @outcome
      end
    end
  end
end
