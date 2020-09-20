class CrackCode
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def message_size
    @message.size
  end

end
