require 'date'

class Shift 
  attr_reader :alphabet, 
              :key,
              :date

  def initialize(input = {})
    @alphabet = ("a".."z").to_a << " "
    @key = input[:key] || ""
    @date = input[:date] || Date.today
  end

  def new_key
    @key = 5.times.map{rand(10)}.join.to_s
  end

  def create_offset
    (date.strftime('%d%m%y').to_i ** 2).to_s[-4..-1]
  end

  def subkeys
    { :a => key[0..1],
      :b => key[1..2],
      :c => key[2..3],
      :d => key[3..4]}
  end
end