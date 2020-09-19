require './lib/key_generator'
require './lib/offset_generator'
require './lib/shift'
require './lib/messenger'

class Enigma
  attr_reader :message_file,
              :message,
              :key,
              :date

  def initialize(message_file = nil)
    @message_file = message_file
    @message = transform
    @key = key
    @date = date
  end

  def transform
    return nil if @message_file == nil
    Messenger.new(@message_file).transform
  end

  def encrypt(message = @message, key = @key, date = @date)
    shift = Shift.new(message) if date == nil && key == nil
    shift = Shift.new(message, key) if date == nil && key != nil
    shift = Shift.new(message, key, date) if date != nil && key != nil
    { encryption: shift.encrypt_message.join, key: shift.key, date: shift.date }
  end

  def decrypt(message = @message, key = @key, date = @date)
    shift = Shift.new(message, key) if date == nil
    shift = Shift.new(message, key, date) if date != nil
    { decryption: shift.decrypt_message.join, key: shift.key, date: shift.date }
  end

end
