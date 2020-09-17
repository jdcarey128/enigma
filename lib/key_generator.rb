class KeyGenerator
  attr_reader :key, :key_digit_count, :shift_key_letters

  def initialize(key)
    @key = key
    @shift_keys = {}
    @key_digit_count = (0..4).to_a
    @shift_key_letters = ('a'..'d').to_a
    #
    # @a_key = ""
    # @b_key = ""
    # @c_key = ""
    # @d_key = ""
  end

  def split_key
    @key.split('')
  end

  def shift_keys
    require "pry"; binding.pry
  end


  def a_key
    @a_key = split_key[0..1].join
  end

  def b_key
    @b_key = split_key[1..2].join
  end

  def c_key
    @c_key = split_key[2..3].join
  end

  def d_key
    @d_key = split_key[3..4].join
  end

end
