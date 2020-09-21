require './lib/listable'

class KeyGenerator
  include Listable

  attr_reader :key, :key_digit_count, :shift_key_letters

  def initialize(key = KeyGenerator.generate_key)
    @key = key
    @shift_keys = {}
    @key_digit_count = (0..4).to_a
    @shift_key_letters = get_shifts.to_a
  end

  def self.generate_key
    '%05d' % rand(10 ** 5)
  end

  def shift_keys
    digits = key_digit_count
    @shift_key_letters.each do |letter|
      @shift_keys[letter] = splitter(@key)[digits[0]..digits[1]].join
      digits = digits.rotate
    end
    @shift_keys
  end

end
