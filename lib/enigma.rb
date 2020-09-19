require './lib/key_generator'
require './lib/offset_generator'
require './lib/shift'

class Enigma
  attr_reader :encrypted_message,
              :decrypted_message,
              :key,
              :date

  def initialize
    # (encrypted_message = nil, decrypted_message = nil, key = nil, date = nil)
    @encrypted_message = encrypted_message
    @decrypted_message = decrypted_message
    @key = key
    @date = date
  end

  def encrypt(message, key = @key, date = @date)
    if date == nil
      shift = Shift.new(message, key)
    else
      shift = Shift.new(message, key, date)
    end
    { encryption: shift.encrypt_message.join, key: shift.key, date: shift.date }
  end

  def decrypt(message, key, date)
    shift = Shift.new(message, key, date)
    { decryption: shift.decrypt_message.join, key: shift.key, date: shift.date }
  end

end
