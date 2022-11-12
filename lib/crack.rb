require_relative './enigma'
require_relative './shift'


class Crack < Enigma
  include Shift

end