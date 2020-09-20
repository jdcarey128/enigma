require './test/test_helper'

class CrackCodeTest < Minitest::Test

  def test_it_exists_and_has_attributes
    crack = CrackCode.new("vjqtbeaweqihssi")
    assert_instance_of CrackCode, crack
    assert_equal "vjqtbeaweqihssi", crack.message
  end

  def test_it_can_count_message_size
    crack = CrackCode.new("vjqtbeaweqihssi")
    assert_equal 15, crack.message_size 
  end

end
