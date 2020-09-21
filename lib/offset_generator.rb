require './lib/listable'
require 'date'

class OffsetGenerator
  include Listable

  attr_reader :date

  def initialize(date = get_date)
    @date = date
    @shift_offsets = {}
    @shift_offset_letters = ('a'..'d').to_a
  end

  def square_date
    (@date.to_i * @date.to_i).to_s
  end

  def shift_offsets
    digits = splitter(square_date)[-4..-1]
    @shift_offset_letters.each do |letter|
      @shift_offsets[letter] = digits[0]
      digits.rotate!
    end
    @shift_offsets
  end

  def get_date
    Date.today.strftime("%d%m%y")
  end

end
