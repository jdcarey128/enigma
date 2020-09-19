require './test/test_helper'

class MessengerTest < Minitest::Test

  def test_it_exists_and_has_attributes
    message = Messenger.new(File.open('./lib/message_sample.txt'),
                            File.open('./lib/encrypted_sample.txt'))
    expected = "We shall fight on the beaches!"
    assert_instance_of Messenger, message
    assert_equal expected, message.decryption
    assert_equal '', message.encryption
  end

end
