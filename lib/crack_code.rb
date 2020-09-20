require './lib/splitable'
require './lib/offset_generator'

class CrackCode
  include Splitable
  attr_reader :message, :date, :offsets

  def initialize(message, date = OffsetGenerator.new.date)
    @message = message
    @date = date
    @offsets = OffsetGenerator.new(date).shift_offsets
    @alphabet = ('a'..'z').to_a << ' '
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

  def calculate_shift(decrypted_value, encrypted_value)
    if (@alphabet.index(encrypted_value) - @alphabet.index(decrypted_value)) < 0
      (27 - @alphabet.index(decrypted_value)) + @alphabet.index(encrypted_value)
    else
      @alphabet.index(encrypted_value) - @alphabet.index(decrypted_value)
    end
  end



end
