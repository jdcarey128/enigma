require './test/test_helper'

class EnigmaTest < Minitest::Test

  def test_it_exists_and_has_attributes
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
    assert_nil enigma.encrypted_message
    assert_nil enigma.decrypted_message
    assert_nil enigma.key
    assert_nil enigma.date
  end

  def test_it_can_encrypt_message_with_key_and_date
    enigma = Enigma.new
    expected =  {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }
    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt_message_with_key_and_date
    enigma = Enigma.new
    expected =  {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }
    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_encrypt_message_with_only_key_aaa
    enigma = Enigma.new
    Date.stubs(:today).returns(Date.new(1995,8,4))
    expected =  {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }
    assert_equal expected, enigma.encrypt("hello world", "02715")
  end

end
