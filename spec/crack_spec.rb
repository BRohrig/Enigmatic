require './lib/crack'

RSpec.describe Crack do
  # let(:crack) {Crack.new("crack is whack end", "2022-11-10")}
  let(:crack2) {Crack.new("ipyqpkvstddzddawt!mmpgmfspmcpemyponc?krse", "2022-11-12")}

  xit 'exists and is a subclass of enigma, and has the shift module loaded' do
    expect(crack).to be_a(Crack)
    expect(crack.class.superclass).to eq(Enigma)
    expect(crack.class.included_modules).to include(Shift)
    expect(crack.date).to eq("2022-11-10")
    crack2 = Crack.new("crack is still whack end")
    expect(crack2.date).to eq(Date.today.to_s)
  end

  xit 'can find the last four characters of a message' do
    expect(crack.find_last_four).to eq(" end")
    expect(crack2.find_last_four).to eq("krse")
  end

  xit 'can find the a shift' do
    # expect(crack.find_a_shift).to eq(-9)
    expect(crack2.find_a_shift).to eq(1)
  end

  it 'can find all possible options for the a subkey' do
    # expect(crack.find_a_subkey).to eq([19, 46, 73])
    expect(crack2.find_a_subkey).to eq([20, 47, 74])
  end

  xit 'can find all possible options for the b subkey' do
    # expect(crack.find_b_subkey).to eq([9, 36, 63, 90])
    expect(crack2.find_b_subkey).to eq([3, 30, 57, 84])
  end

  xit 'can find all possible options for the c subkey' do
    expect(crack2.find_c_subkey).to eq([5, 32, 59, 86])
  end

  xit 'can find all possible options for the d subkey' do
    expect(crack2.find_d_subkey).to eq([1, 28, 55, 82])
  end

  xit 'can turn the possible keys into strings and rjust them' do
    expect(crack2.stringify_them("a")).to eq(["20", "47", "74"])
    expect(crack2.stringify_them("b")).to eq(["03", "30", "57", "84"])
    expect(crack2.stringify_them("c")).to eq(["05", "32", "59", "86"])
    expect(crack2.stringify_them("d")).to eq(["01", "28", "55", "82"])
  end

  xit 'can find the pieces of the key' do
    expect(crack2.figure_out_key).to eq("20328")
  end

  it 'can decrypt a message with no key provided' do
    expect(crack2.decrypt_message("ipyqpkvstddzddawt!mmpgmfspmcpemyponc?krse", crack2.figure_out_key, "2022-11-12")).to eq("hello instructors! how are you today? end")

  end

end