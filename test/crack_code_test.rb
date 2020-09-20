require './test/test_helper'

class CrackCodeTest < Minitest::Test

  def test_it_exists_and_has_attributes_bbb
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
    expected = {
    0=>{:shift => 'd', :encrypted=>"h", :decrypted=>" "},
    1=>{:shift => 'a', :encrypted=>"s", :decrypted=>"e"},
    2=>{:shift => 'b', :encrypted=>"s", :decrypted=>"n"},
    3=>{:shift => 'c', :encrypted=>"i", :decrypted=>"d"}
                }
    assert_equal expected, crack.merge_indices
  end

  def test_it_can_calculate_the_shift_between_encrypted_and_decrypted
    crack = CrackCode.new("vjqtbeaweqihssi")
    assert_equal 8, crack.calculate_shift(" ", "h")
    assert_equal 14, crack.calculate_shift("e", "s")
    assert_equal 5, crack.calculate_shift("n", "s")
    assert_equal 5, crack.calculate_shift("d", "i")
  end

  def test_it_can_organize_shift_values
    crack = CrackCode.new("vjqtbeaweqihssi")
    expected = {
    'd'=> 8,
    'a'=> 14,
    'b'=> 5,
    'c'=> 5
                }
    assert_equal expected, crack.organize_shift_values
  end

  def test_it_can_calculate_key_with_date
    skip
    Date.stubs(:today).returns(Date.new(2018,10,29))
    crack = CrackCode.new("vjqtbeaweqihssi")
    require "pry"; binding.pry
  end

end
