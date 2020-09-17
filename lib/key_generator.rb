class KeyGenerator
  attr_reader :key, :key_digit_count, :shift_key_letters

  def initialize(key = key_generator)
    @key = key
    @shift_keys = {}
    @key_digit_count = (0..4).to_a
    @shift_key_letters = ('a'..'d').to_a
  end

  def split_key
    @key.split('')
  end

  def shift_keys
    digits = key_digit_count
    @shift_key_letters.each do |letter|
      @shift_keys[letter] = split_key[digits[0]..digits[1]].join
      digits = digits.rotate
    end
    @shift_keys
  end

  def key_generator
  end 

end
