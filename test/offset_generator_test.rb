require './test/test_helper'

class OffsetGeneratorTest < Minitest::Test

  def test_it_exists_and_has_attributes
    offset_1 = OffsetGenerator.new("17092020")
    assert_instance_of OffsetGenerator, offset_1
    assert_equal "17092020", offset_1.date
  end

end
