require './test/test_helper'

class ShiftTest < Minitest::Test

  def test_it_exists_and_has_attributes
    shift = Shift.new("hello world", "02794", "170920")
    assert_instance_of Shift, shift
    assert_equal "hello world", shift.message
    assert_equal "02794", shift.key
    assert_equal "170920", shift.date 
  end


end
