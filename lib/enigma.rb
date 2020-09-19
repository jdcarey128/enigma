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

  def encrypt(message, key, date)
    shift = Shift.new(message, key, date)
    { encryption: shift.encrypt_message.join, key: shift.key, date: shift.date }
  end

end
