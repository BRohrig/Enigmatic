require_relative './rotation'
require_relative './shift'

class Enigma
  attr_reader :key, :date

  def encrypt(message, key, date)
    shift = Shift.new({:key => key, :date => date})
    new_message = Rotation.new(message).encrypt(shift.find_shifts)
    "{ 
      encryption: => #{new_message},
      key:        => #{key},
      date:       => #{Date.parse(shift.date).strftime('%d%m%y')}
    }"
  end

  def encrypt_message(message, key = Shift.new.new_key, date = Date.today.to_s)
    @key  = key
    @date = date
    shift = Shift.new({:key => key, :date => date})
    Rotation.new(message).encrypt(shift.find_shifts)
  end

  def decrypt(message, key, date)
    shift = Shift.new({:key => key, :date => date})
    new_message = Rotation.new(message).decrypt(shift.find_shifts)
    "{ 
      decryption: => #{new_message},
      key:        => #{key},
      date:       => #{Date.parse(shift.date).strftime('%d%m%y')}
    }"
  end

  def decrypt_message(message, key = Shift.new.new_key, date = Date.today.to_s)
    @key  = key
    @date = date
    shift = Shift.new({:key => key, :date => date})
    Rotation.new(message).decrypt(shift.find_shifts)
  end
end