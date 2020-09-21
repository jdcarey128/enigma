require './lib/listable'

class Messenger
  include Listable

  attr_reader :message, :file_destination

  def initialize(message, file_destination = nil)
    @message = message
    @file_destination = file_destination
  end

  def transform
    return nil if @message == nil
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
