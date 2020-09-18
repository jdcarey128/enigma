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

  def shift_offsets
    OffsetGenerator.new(@date).shift_offsets
  end

  def shift_values
    shift_keys.merge(shift_offsets) do |shift, key, offset|
      '%02d' % (key.to_i + offset.to_i).to_s
    end
  end

end
