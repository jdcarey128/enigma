require './test/test_helper'

class CrackCodeTest < Minitest::Test

  def test_it_exists_and_has_attributes
    crack = CrackCode.new("vjqtbeaweqihssi")
    assert_instance_of CrackCode, crack
    assert_equal "vjqtbeaweqihssi", crack.message
  end

  def test_it_can_produce_a_matching_array_with_shifts
    crack = CrackCode.new("vjqtbeaweqihssi")
    expected = ['a', 'b', 'c', 'd', 'a', 'b', 'c', 'd', 'a', 'b', 'c', 'd', 'a', 'b', 'c']
    assert_equal expected, crack.match_sequence
  end

end
