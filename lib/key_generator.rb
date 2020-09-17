class KeyGenerator
  attr_reader :key

  def initialize(key)
    @key = key
    @a_key = ""
    @b_key = ""
    @c_key = ""
    @d_key = ""
  end

  def split_key
    @key.split('')
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
