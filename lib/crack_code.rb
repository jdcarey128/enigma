require 'splitable'

class CrackCode
  include Splitable
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
      letters.rotate!
    end
    shift_sequence.join
  end

  def assign_index(object)
    letter_index = {}
    splitter(object).each_with_index do |letter, index|
      letter_index[index] = letter
    end
    letter_index
  end


end
