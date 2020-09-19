require './lib/key_generator'
require './lib/offset_generator'
require './lib/splitaccumulatable'

class Shift
  attr_reader :message, :key, :date, :alphabet, :stripped_message
  include Splitaccumulatable

  def initialize(message, key = KeyGenerator.new, date = OffsetGenerator.new)
    @message = message
    @stripped_message = splitter(message)
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



  def encrypt_letter(letter, shift_value)
    until shift_value <= 27
      shift_value -= 27
    end
    if (@alphabet.index(letter) + shift_value) > 27
      letter = @alphabet.fetch(@alphabet.index(letter) + shift_value - 27)
    else
      letter = @alphabet.fetch(@alphabet.index(letter) + shift_value)
    end
    letter
  end

  def encrypt_message
    count = 0
    message = @stripped_message
    until count == @stripped_message.count
      @shift_values.each do |shift, value|
        require "pry"; binding.pry
      end
    end
  end

end
