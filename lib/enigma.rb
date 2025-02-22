require './lib/key_generator'
require './lib/offset_generator'
require './lib/shift'
require './lib/messenger'
require './lib/crack_key'

class Enigma
  attr_reader :message_file,
              :new_message_destination,
              :message,
              :key,
              :date

  def initialize(message_file = nil, new_message_destination = './lib/general_sample.txt',
                key = nil, date = nil)
    @message_file = message_file
    @new_message_destination = new_message_destination
    @message = transform
    @key = key
    @date = date
  end

  def transform
    return nil if @message_file == nil
    Messenger.new(File.open(@message_file).read.chomp).transform
  end

  def encrypt(message = @message, key = @key, date = @date)
    if date == nil && key == nil
      shift = Shift.new(message)
    elsif date == nil && key != nil
      shift = Shift.new(message, key)
    elsif date != nil && key != nil
      shift = Shift.new(message, key, date)
    end
    Messenger.new(shift.encrypt_message.join, @new_message_destination).write_message
    result = { encryption: shift.encrypt_message.join, key: shift.key, date: shift.date }
  end

  def decrypt(message = @message, key = @key, date = @date)
    if date == nil
      shift = Shift.new(message, key)
    elsif date != nil
      shift = Shift.new(message, key, date)
    end
    Messenger.new(shift.decrypt_message.join, @new_message_destination).write_message
    { decryption: shift.decrypt_message.join, key: shift.key, date: shift.date }
  end

  def crack(message = @message, date = @date)
    if date == nil
      key = CrackKey.new(message).produce_key
      shift = Shift.new(message, key)
    else
      key = CrackKey.new(message, date).produce_key
      shift = Shift.new(message, key, date)
    end
    Messenger.new(shift.decrypt_message.join, @new_message_destination).write_message
    { decryption: shift.decrypt_message.join, key: key, date: shift.date }
  end

end
