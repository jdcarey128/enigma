require './test/test_helper'

class CrackCodeTest < Minitest::Test

  def test_it_exists_and_has_attributes
    crack = CrackCode.new("vjqtbeaweqihssi")
    assert_instance_of CrackCode, crack
    assert_equal "vjqtbeaweqihssi", crack.message
  end

  def test_it_can_produce_a_matching_sequence_with_shifts
    crack = CrackCode.new("vjqtbeaweqihssi")
    expected = "dabc"
    assert_equal expected, crack.match_sequence
  end

  def test_it_can_assign_last_four_characters_to_index
    crack = CrackCode.new("vjqtbeaweqihssi")
    expected = {0=>"h", 1=>"s", 2=>"s", 3=>"i"}
    assert_equal expected, crack.assign_index("hssi")
    expected = {0 => 'd', 1 => 'a', 2 => 'b', 3 => 'c'}
    assert_equal expected, crack.assign_index("dabc")
  end

  def test_it_can_merge_character_and_shift_indices
    crack = CrackCode.new("vjqtbeaweqihssi")
    expected = {0=>{:letter=>"h", :shift=>"d"}, 1=>{:letter=>"s", :shift=>"a"},
    2=>{:letter=>"s", :shift=>"b"}, 3=>{:letter=>"i", :shift=>"c"}}
    assert_equal expected, crack.merge_indices
  end

end
