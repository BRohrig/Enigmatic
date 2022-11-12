require_relative './enigma'
require_relative './shift'


class Crack < Enigma
  include Shift

  attr_reader :date

  def initialize(date = Date.today)
    @date = date.to_s
  end

  def reverse_offsets
   {:a => -(create_offset[0].to_i),
    :b => -(create_offset[1].to_i),
    :c => -(create_offset[2].to_i),
    :d => -(create_offset[3].to_i)}
  end

end