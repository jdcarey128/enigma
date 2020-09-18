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

  def test_it_can_

end
