require './test/test_helper'

class KeyGeneratorTest < Minitest::Test

  def test_it_exists_and_has_attributes
    key_1 = KeyGenerator.new("02794")
    assert_instance_of KeyGenerator, key_1
    assert_equal "02794", key_1.key
  end

  def test_it_can_assign_digits_to_shit_keys
    key_1 = KeyGenerator.new("02794")
    assert_equal "02", key_1.a_key
    assert_equal "27", key_1.b_key
    assert_equal "79", key_1.c_key
    assert_equal "94", key_1.d_key
  end



end
