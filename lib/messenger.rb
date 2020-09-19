require './lib/splitable'

class Messenger
  include Splitable

  def initialize(message)
    @message = message
  end

  def message
    @message.read.chomp
  end

  def transform
    splitter(message).map do |character|
      character.downcase
    end.join
  end

  def encrypt_message(message, file_destination)
    encryption = File.open(file_destination, 'w')
    encryption.write(message)
    encryption.close
  end

  def decrypt_message(message, file_destination)
    decryption = File.open(file_destination, 'w')
    decryption.write(message)
    decryption.close
  end


end
