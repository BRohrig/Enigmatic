require_relative './enigma'
require_relative './shift'


class Crack < Enigma
  include Shift

  attr_reader :date

  def initialize(message, date = Date.today)
    @message  = message
    @date     = date.to_s
    @letters  = ("a".."z").to_a << " "
  end

  def find_last_four
    @message[-4..-1]
  end

  def find_space_key_position
    (@message.length - 4) % 4
  end

  def find_e_key_position
    (@message.length - 3) % 4
  end

  def find_n_key_position
    (@message.length - 2) % 4
  end

  def find_d_key_position
    (@message.length - 1) % 4
  end

  def find_a_shift_position
    if find_space_key_position == 0
      -4
    elsif find_e_key_position == 0
      -3
    elsif find_n_key_position == 0
      -2
    elsif find_d_key_position == 0
      -1
    end
  end

  def find_b_shift_position
    if find_space_key_position == 1
      -4
    elsif find_e_key_position == 1
      -3
    elsif find_n_key_position == 1
      -2
    elsif find_d_key_position == 1
      -1
    end
  end

  def find_c_shift_position
    if find_space_key_position == 2
      -4
    elsif find_e_key_position == 2
      -3
    elsif find_n_key_position == 2
      -2
    elsif find_d_key_position == 2
      -1
    end
  end

  def find_d_shift_position
    if find_space_key_position == 3
      -4
    elsif find_e_key_position == 3
      -3
    elsif find_n_key_position == 3
      -2
    elsif find_d_key_position == 3
      -1
    end
  end

  def find_a_shift
    if find_a_shift_position == -4
      @letters.index(@message[find_a_shift_position]) - 26
    elsif find_a_shift_position == -3
      @letters.index(@message[find_a_shift_position]) - 4
    elsif find_a_shift_position == -2
      @letters.index(@message[find_a_shift_position]) - 13
    elsif find_a_shift_position == -1
      @letters.index(@message[find_a_shift_position]) - 3
    end
  end

  def find_b_shift
    if find_b_shift_position == -4
      @letters.index(@message[find_b_shift_position]) - 26
    elsif find_b_shift_position == -3
      @letters.index(@message[find_b_shift_position]) - 4
    elsif find_b_shift_position == -2
      @letters.index(@message[find_b_shift_position]) - 13
    elsif find_b_shift_position == -1
      @letters.index(@message[find_b_shift_position]) - 3
    end
  end

  def find_c_shift
    if find_c_shift_position == -4
      @letters.index(@message[find_c_shift_position]) - 26
    elsif find_c_shift_position == -3
      @letters.index(@message[find_c_shift_position]) - 4
    elsif find_c_shift_position == -2
      @letters.index(@message[find_c_shift_position]) - 13
    elsif find_c_shift_position == -1
      @letters.index(@message[find_c_shift_position]) -3
    end
  end

  def find_d_shift
    if find_d_shift_position == -4
      @letters.index(@message[find_d_shift_position]) - 26
    elsif find_d_shift_position == -3
      @letters.index(@message[find_d_shift_position]) - 4
    elsif find_d_shift_position == -2
      @letters.index(@message[find_d_shift_position]) - 13
    elsif find_d_shift_position == -1
      @letters.index(@message[find_d_shift_position]) -3
    end
  end
    

  def find_a_subkey
    multiple = (find_a_shift-(create_offset[0].to_i)) % 27
    x = [0, 0, 0, 0]
    x.each_with_index.map do |subkey, i|
      subkey + multiple + (i * 27)
    end.reject { |val| val > 99 }
  end

  def find_b_subkey
    multiple = (find_b_shift-(create_offset[1].to_i)) % 27
    x = [0, 0, 0, 0]
    x.each_with_index.map do |subkey, i|
      subkey + multiple + (i * 27)
    end.reject { |val| val > 99 }
  end

  def find_c_subkey
    multiple = (find_c_shift-(create_offset[2].to_i)) % 27
    x = [0, 0, 0, 0]
    x.each_with_index.map do |subkey, i|
      subkey + multiple + (i * 27)
    end.reject { |val| val > 99 }
  end

  def find_d_subkey
    multiple = (find_d_shift-(create_offset[3].to_i)) % 27
    x = [0, 0, 0, 0]
    x.each_with_index.map do |subkey, i|
      subkey + multiple + (i * 27)
    end.reject { |val| val > 99 }
  end

  def figure_out_key
    key = [find_a_key, find_b_key, find_c_key, find_d_key]
    key.reduce([]) { |num, key| num | key.split }.join(' ').delete(" ").squeeze
  end

  def find_a_key
    stringify_them("a").find do |string|
      stringify_them("b").find do |string2|
        string[1] == string2[0]
      end
    end
  end

  def find_b_key
    stringify_them("b").find do |string3|
      find_a_key[1] == string3[0]
    end
  end

  def find_c_key
    stringify_them("c").find do |string4|
      find_b_key[1] == string4[0]
    end
  end

  def find_d_key
    stringify_them("d").find do |string5|
      find_c_key[1] == string5[0]
    end
  end

  def stringify_them(arg)
    if arg == "a"
      find_a_subkey.map do |num|
        num.to_s.rjust(2, "0")
      end
    elsif arg == "b"
      find_b_subkey.map do |num|
        num.to_s.rjust(2, "0")
      end
    elsif arg == "c"
      find_c_subkey.map do |num|
        num.to_s.rjust(2, "0")
      end
    elsif arg == "d"
      find_d_subkey.map do |num|
        num.to_s.rjust(2, "0")
      end
    end
  end

end