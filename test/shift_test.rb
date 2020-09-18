require './test/test_helper'

class ShiftTest < Minitest::Test

  def test_it_exists_and_has_attributes
    shift = Shift.new("hello world", "02794", "170920")
    assert_instance_of Shift, shift
    assert_equal "hello world", shift.message
    assert_equal "02794", shift.key
    assert_equal "170920", shift.date
  end

  def test_it_can_combine_keys_and_offsets_for_shift_value
    shift = Shift.new("hello world", "02794", "170920")
    expected = {
      "a" => "2",
      "b" => "31",
      "c" => "79",
      "d" => "94"
    }
    assert_equal expected, shift.shift_values
    shift_2 = Shift.new("hello world", "02794", "160920")
    expected = {
      "a" => "8",
      "b" => "31",
      "c" => "79",
      "d" => "94"
    }
    assert_equal expected, shift_2.shift_values
  end


end
