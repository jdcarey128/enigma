require './test/test_helper'

class EnigmaTest < Minitest::Test

  def test_it_exists_and_has_attributes
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
    assert_equal '', enigma.encrypted_message
    assert_equal '', enigma.decrypted_message
    assert_equal '', enigma.key
    assert_equal '', enigma.date
  end

end
