require './lib/key_generator'
require './lib/offset_generator'
require './lib/shift'

class Enigma
  attr_reader :encryption,
              :decryption,
              :key,
              :date

  def initialize
    # (encryption = nil, decryption = nil, key = nil, date = nil)
    @encryption = encryption
    @decryption = decryption
    @key = key
    @date = date
  end

  def encrypt(message, key = @key, date = @date)
    shift = Shift.new(message, key) if date == nil
    shift = Shift.new(message, key, date) if date != nil
    { encryption: shift.encrypt_message.join, key: shift.key, date: shift.date }
  end

  def decrypt(message, key = @key, date = @date)
    shift = Shift.new(message, key) if date == nil
    shift = Shift.new(message, key, date) if date != nil
    { decryption: shift.decrypt_message.join, key: shift.key, date: shift.date }
  end

end
