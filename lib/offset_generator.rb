class OffsetGenerator
  attr_reader :date

  def initialize(date)
    @date = date
  end

  def square_date
    (@date.to_i * @date.to_i).to_s
  end

end
