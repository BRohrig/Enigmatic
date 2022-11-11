require 'date'

class Shift 
  attr_reader :key,
              :date

  def initialize(input = {})
    @key  = input[:key] || new_key
    @date = input[:date] || Date.today.to_s
  end

  def new_key
    @key = 5.times.map{rand(10)}.join.to_s
  end

  def create_offset
    (Date.parse(date).strftime('%d%m%y').to_i ** 2).to_s[-4..-1]
  end

  def subkeys
    { :a => key[0..1],
      :b => key[1..2],
      :c => key[2..3],
      :d => key[3..4]}
  end

  def find_shifts
    { :A => subkeys[:a].to_i + create_offset[0].to_i,
      :B => subkeys[:b].to_i + create_offset[1].to_i,
      :C => subkeys[:c].to_i + create_offset[2].to_i,
      :D => subkeys[:d].to_i + create_offset[3].to_i,}
  end
end