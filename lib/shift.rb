class Shift
  attr_reader :message, :key, :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
  end

  def shift_keys
    KeyGenerator.new(@key).shift_keys
  end

  def shift_values

  end

end
