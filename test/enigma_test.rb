require './test/test_helper'

class EnigmaTest < Minitest::Test

  def test_it_exists_and_has_attributes
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
    assert_nil enigma.message
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

  def test_it_can_encrypt_message_with_only_key
    enigma = Enigma.new
    Date.stubs(:today).returns(Date.new(1995,8,4))
    expected =  {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }
    assert_equal expected, enigma.encrypt("hello world", "02715")
  end

  def test_it_can_decrypt_message_with_only_key_bbb
    enigma = Enigma.new
    Date.stubs(:today).returns(Date.new(1995,8,4))
    encrypted = enigma.encrypt("hello world", "02715")
    expected =  {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }
    assert_equal expected, enigma.decrypt(encrypted[:encryption], "02715")
  end

  def test_it_can_encrypt_message_with_random_key_and_todays_date
    enigma = Enigma.new
    Date.stubs(:today).returns(Date.new(1995,8,4))
    KeyGenerator.stubs(:generate_key).returns("02715")
    expected =  {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }
    assert_equal expected, enigma.encrypt("hello world")
  end

  def test_it_can_transform_a_message
    enigma = Enigma.new('./lib/message_sample.txt')
    expected = "hello world!"
    assert_equal expected, enigma.transform
  end

  def test_it_can_write_encryption_to_file_aaa
    file_location = './lib/enigma_message_sample.txt'
    file_destination = './lib/encrypted_sample.txt'
    File.truncate(file_destination, 0)
    assert_equal '', File.open(file_destination).read
    enigma = Enigma.new(file_location, file_destination, "02715", "040895")
    expected =  "keder ohulw"
    enigma.encrypt
    assert_equal expected, File.open(file_destination).read
  end

end
