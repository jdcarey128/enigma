require './lib/splitaccumulatable'

class OffsetGenerator
  include Splitaccumulatable

  attr_reader :date

  def initialize(date)
    @date = date
    @shift_offsets = {}
  end

  def square_date
    (@date.to_i * @date.to_i).to_s
  end

  def shift_offsets

  end



end
