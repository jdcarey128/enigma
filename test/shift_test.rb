require './test/test_helper'

class ShiftTest < Minitest::Test

  def test_it_exists_and_has_attributes
    shift = Shift.new("hello world", "02794", "170920")
    assert_instance_of Shift, shift
    assert_equal "hello world", shift.message
    assert_equal "02794", shift.key
    assert_equal "170920", shift.date
    expected = (('a'..'z').to_a << ' ')
    assert_equal expected, shift.alphabet
  end

  def test_it_can_return_shift_keys
    shift = Shift.new("hello world", "02794", "170920")
    expected = {
      "a" => "02",
      "b" => "27",
      "c" => "79",
      "d" => "94"
    }
    assert_equal expected, shift.shift_keys
  end

  def test_it_can_return_shift_offsets
    Date.stubs(:today).returns(Date.new(2020,9,16))
    shift = Shift.new("hello world", "02794", "160920")
    expected = {
      "a" => "6",
      "b" => "4",
      "c" => "0",
      "d" => "0"
    }
    assert_equal expected, shift.shift_offsets
  end

  def test_it_can_combine_keys_and_offsets_for_shift_values
    shift = Shift.new("hello world", "02794", "170920")
    expected = {
      "a" => "08",
      "b" => "31",
      "c" => "79",
      "d" => "94"
    }
    assert_equal expected, shift.shift_values
  end

  def test_it_can_return_a_split_message
    shift = Shift.new("hello world", "02794", "170920")
    expected = ['h', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd']
    assert_equal expected, shift.split_message
  end

  def test_it_can_reduce_shift_value_to_below_27
    shift = Shift.new("hello world", "01010", "170920")
    assert_equal 3, shift.shift_reducer(30)
    assert_equal 0, shift.shift_reducer(54)
    assert_equal 26, shift.shift_reducer(80)
  end

  def test_it_can_return_new_letter_given_shift_value
    shift = Shift.new("hello world", "01010", "170920")
    assert_equal 'f', shift.encrypt_letter('w', 10)
    assert_equal 'd', shift.encrypt_letter('a', 30)
    assert_equal 'd', shift.encrypt_letter('d', 54)
    assert_equal 'r', shift.encrypt_letter('s', 80)
  end

  def test_it_can_prune_message
    shift = Shift.new("hello world", "01010", "170920")
    message = ['h', 'e', 'l', 'l', 'o']
    assert_equal ['h', 'e'], shift.prune_message(message, 5, 2)
  end

  def test_it_can_shift_stripped_message_characters_to_new_message
    shift = Shift.new("hello world", "01010", "170920")
    expected = {
      "a" => "07",
      "b" => "14",
      "c" => "01",
      "d" => "10"
    }
    assert_equal expected, shift.shift_values
    expected = ['o', 's', 'm', 'v', 'v', 'n', 'x', 'y', 'y', 'z', 'e']
    assert_equal expected, shift.encrypt_message
  end


end
