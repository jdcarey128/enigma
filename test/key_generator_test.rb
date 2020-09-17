require './test/test_helper'

class KeyGeneratorTest < Minitest::Test

  def test_it_exists_and_has_attributes
    key_1 = KeyGenerator.new("02794")
    assert_instance_of KeyGenerator, key_1
    assert_equal "02794", key_1.key
  end



end
