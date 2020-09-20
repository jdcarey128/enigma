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
    shift_sequence.join[-4..-1]
  end

  def assign_index(object)
    letter_index = {}
    splitter(object).each_with_index do |letter, index|
      letter_index[index] = letter
    end
    letter_index
  end

  def merge_indices
    decrypted = splitter(' end')
    assign_index(@message[-4..-1]).merge(assign_index(match_sequence)) do |index, letter, shift|
      {shift: shift, encrypted: letter, decrypted: decrypted[index]}
    end
  end


end
