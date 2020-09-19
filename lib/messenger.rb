class Messenger
  attr_reader :decryption, :encryption

  def initialize(decryption, encryption)
    @decryption = decryption.read.chomp
    @encryption = encryption.read.chomp 
  end

end
