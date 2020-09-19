class Messenger

  def initialize(message)
    @message = message
  end

  def message
    @message.read.chomp
  end
end
