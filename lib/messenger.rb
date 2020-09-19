require './lib/splitable'

class Messenger
  include Splitable

  attr_reader :message, :file_destination

  def initialize(message, file_destination = nil)
    @message = message
    @file_destination = file_destination
  end

  # def message
  #   File.open(@message).read.chomp
  # end

  def transform
    return nil if @message == nil
    # require "pry"; binding.pry
    splitter(@message).map do |character|
      character.downcase
    end.join
  end

  def write_message
    encryption = File.open(@file_destination, 'w')
    encryption.write(message)
    encryption.close
  end

end
