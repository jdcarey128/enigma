class Enigma
  attr_reader :encrypted_message,
              :decrypted_message,
              :key,
              :date

  def initialize(encrypted_message = '', decrypted_message = '',
                key = '', date = '')
    @encrypted_message = encrypted_message
    @decrypted_message = decrypted_message
    @key = key
    @date = date
  end


end
