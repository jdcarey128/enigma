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

  def test_it_can_encrypt_message
    enigma = Enigma.new
    expected =  {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }
    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

end
