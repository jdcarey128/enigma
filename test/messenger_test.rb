require './test/test_helper'

class MessengerTest < Minitest::Test

  def test_it_exists_and_has_attributes
    messenger = Messenger.new(File.open('./lib/message_sample.txt'))
    expected = "We shall fight on the beaches!"
    assert_instance_of Messenger, messenger
    assert_equal expected, messenger.message
  end

  def test_it_can_downcase_all_capitalized_letters_in_message
    messenger = Messenger.new(File.open('./lib/message_sample.txt'))
    expected = "we shall fight on the beaches!"
    assert_equal expected, messenger.transform
  end

  def test_it_can_write_message_to_encrypted_txt_file
    file_destination = './lib/encrypted_sample.txt'
    File.truncate(file_destination, 0)
    messenger = Messenger.new(File.open('./lib/message_sample.txt'))
    assert_equal "", File.open(file_destination).read
    messenger.encrypt_message(";lkjein;lkj aslkjdlk", file_destination)
    expected = ";lkjein;lkj aslkjdlk"
    actual = File.open(file_destination).read
    assert_equal expected, actual
  end

  def test_it_can_write_message_to_decrypted_txt_file
    file_destination = './lib/decrypted_sample.txt'
    File.truncate(file_destination, 0)
    messenger = Messenger.new(File.open('./lib/message_sample.txt'))
    assert_equal "", File.open(file_destination).read
    messenger.decrypt_message("we shall fight on the beaches!", file_destination)
    expected = "we shall fight on the beaches!"
    actual = File.open(file_destination).read
    assert_equal expected, actual
  end

end
