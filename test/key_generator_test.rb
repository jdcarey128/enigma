require './test/test_helper'

class KeyGeneratorTest < Minitest::Test

  def test_it_exists_and_has_attributes
    key_1 = KeyGenerator.new("02794")
    assert_instance_of KeyGenerator, key_1
    assert_equal "02794", key_1.key
  end

  def test_it_can_split_key_into_array
    key_1 = KeyGenerator.new("02794")
    expected = ["0", "2", "7", "9", "4"]
    assert_equal expected, key_1.splitter(key_1.key)
  end

  def test_it_can_assign_digits_to_shift_keys
    key_1 = KeyGenerator.new("02794")
    assert_equal "02", key_1.shift_keys['a']
    assert_equal "27", key_1.shift_keys['b']
    assert_equal "79", key_1.shift_keys['c']
    assert_equal "94", key_1.shift_keys['d']
  end

  def test_it_can_generate_a_random_key_without_argument
    KeyGenerator.stubs(:generate_key).returns("50283")
    key_2 = KeyGenerator.new
    assert_equal "50283", key_2.key
  end

  def test_it_can_generate_a_5_digit_random_number
    20.times do
      assert_equal 5, KeyGenerator.generate_key.size
    end
  end

end
