class CrackCode
  attr_reader :message

  def initialize(message)
    @message = message
    @shift_key_letters = ('a'..'d').to_a
  end

  def match_sequence
    shift_sequence = []
    letters = ('a'..'d').to_a
    @message.size.times do
      shift_sequence << letters.first
      letters.rotate
    end
    shift_sequence
  end


end
