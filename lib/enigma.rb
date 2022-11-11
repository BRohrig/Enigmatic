require './rotation'
require './shift'


class Enigma
  def encrypt(message, key, date)
    shift = Shift.new({:key => key, :date => date}).find_shifts
    Rotation.new(message).encrypt(shift)
  end

  def decrypt(message, key, date)
    shift = Shift.new({:key => key, :date => date}).find_shifts
    Rotation.new(message).decrypt(shift)
  end
end