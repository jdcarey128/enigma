require './lib/key_generator'
require './lib/offset_generator'
require './lib/splitable'

class Shift
  attr_reader :message, :key, :date, :alphabet, :split_message
  include Splitable

  def initialize(message, key = KeyGenerator.new.key, date = OffsetGenerator.new.date)
    @message = message
    @split_message = splitter(message)
    @key = key
    @date = date
    @shift_values = shift_values()
    @alphabet = ('a'..'z').to_a << ' '
  end

  def shift_keys
    KeyGenerator.new(@key).shift_keys
  end

  def shift_offsets
    OffsetGenerator.new(@date).shift_offsets
  end

  def shift_values
    shift_keys.merge(shift_offsets) do |shift, key, offset|
      '%02d' % (key.to_i + offset.to_i).to_s
    end
  end

  def shift_reducer(shift_value)
    until shift_value < 27
      shift_value -= 27
    end
    shift_value
  end

  def encrypt_letter(letter, shift_value)
    shift_value = shift_reducer(shift_value)
    if @alphabet.index(letter) == nil
      letter
    elsif (@alphabet.index(letter) + shift_value) >= 27
      letter = @alphabet.fetch(@alphabet.index(letter) + shift_value - 27)
    else
      letter = @alphabet.fetch(@alphabet.index(letter) + shift_value)
    end
    letter
  end

  def decrypt_letter(letter, shift_value)
    shift_value = shift_reducer(shift_value)
    if @alphabet.index(letter) == nil
      letter 
    elsif (@alphabet.index(letter) - shift_value) < 0
      letter = @alphabet.fetch(@alphabet.index(letter) - shift_value + 27)
    else
      letter = @alphabet.fetch(@alphabet.index(letter) - shift_value)
    end
    letter
  end

  def prune_message(message, count, message_length)
    (count - message_length).times do
      message.pop
    end
    message
  end

  def encrypt_message
    shift_message(:encrypt_letter)
  end

  def decrypt_message
    shift_message(:decrypt_letter)
  end

  def shift_message(method_arg)
    count = 0
    message = @split_message.clone
    new_message = []
    until count >= @split_message.count
      @shift_values.map do |shift, value|
        new_message << method(method_arg).call(message[0], value.to_i)
        count += 1
        message.rotate!
      end
    end
    prune_message(new_message, new_message.count, @split_message.count)
  end

end
