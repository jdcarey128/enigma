require './lib/listable'
require './lib/offset_generator'

class CrackKey
  include Listable
  attr_reader :message, :date, :offsets

  def initialize(message, date = OffsetGenerator.new.date)
    @message = message
    @date = date
    @offsets = OffsetGenerator.new(date).shift_offsets
    @alphabet = get_alphabet
  end

  def match_sequence
    shift_sequence = []
    letters = get_shifts.to_a
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
      27 - (@alphabet.index(decrypted_value) - @alphabet.index(encrypted_value))
    else
      @alphabet.index(encrypted_value) - @alphabet.index(decrypted_value)
    end
  end

  def organize_shift_values
    shift_values = {}
    merge_indices.each do |key, value|
      shift_values[value[:shift]] = calculate_shift(value[:decrypted], value[:encrypted])
    end
    shift_values
  end

  def calculate_lowest_shift_keys
    organize_shift_values.merge(@offsets) do |shift, total_shift, offset|
      '%02d' % ((total_shift - offset.to_i).abs).to_s
    end
  end

  def adjust_keys
    count = 0
    letters = get_shifts.to_a
    iteration_letters = get_shifts.to_a
    shift_keys = calculate_lowest_shift_keys()
    iteration_letters.each do |letter|
      until shift_keys[letters[1]][0].to_i == shift_keys[letter][1].to_i
        shift_keys[letters[1]] = (shift_keys[letters[1]].to_i + 27).to_s
      end
      letters.rotate!
      count += 1
      return shift_keys if count == 3
    end
  end

  def produce_key
    keys = adjust_keys()
    keys['a'] + keys['b'][1] + keys['d']
  end

end
