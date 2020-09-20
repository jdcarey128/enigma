require './test/test_helper'

class CrackCodeTest < Minitest::Test

  def test_it_exists_and_has_attributes
    crack = CrackCode.new("vjqtbeaweqihssi")
    assert_instance_of CrackCode, crack
    assert_equal "vjqtbeaweqihssi", crack.message
  end

  def test_it_can_produce_a_matching_sequence_with_shifts
    crack = CrackCode.new("vjqtbeaweqihssi")
    expected = "abcdabcdabcdabc"
    assert_equal expected, crack.match_sequence
  end

  def test_it_can_assign_characters_to_index
    crack = CrackCode.new("vjqtbeaweqihssi")
    expected = {0 => 'v', 1 => 'j', 2 => 'q', 3 => 't', 4 => 'b', 5=>"e", 6=>"a",
      7=>"w", 8=>"e", 9=>"q", 10=>"i", 11=>"h", 12=>"s", 13=>"s", 14=>"i"}
    assert_equal expected, crack.assign_index("vjqtbeaweqihssi")
  end

end
