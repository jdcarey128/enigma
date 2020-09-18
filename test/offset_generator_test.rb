require './test/test_helper'

class OffsetGeneratorTest < Minitest::Test

  def test_it_exists_and_has_attributes
    offset_1 = OffsetGenerator.new("17092020")
    assert_instance_of OffsetGenerator, offset_1
    assert_equal "17092020", offset_1.date
  end

  def test_it_can_square_date
    offset_1 = OffsetGenerator.new("17092020")
    assert_equal "292137147680400", offset_1.square_date
  end

  def test_it_can_assign_square_date_digits_to_offsets
    offset_1 = OffsetGenerator.new("17092020")
    expected = {
      "a" => "0",
      "b" => "4",
      "c" => "0",
      "d" => "0"
    }
    assert_equal expected, offset_1.shift_offsets
  end

  def test_it_can_return_default_date_of_today
    Date.stubs(:today).returns(Date.new(2020,9,16))
    offset_1 = OffsetGenerator.new
    assert_equal "160920", offset_1.date
  end

  def test_it_can_square_date_of_today
    Date.stubs(:today).returns(Date.new(2020,9,16))
    offset_1 = OffsetGenerator.new
    assert_equal "25895246400", offset_1.square_date
  end

end
