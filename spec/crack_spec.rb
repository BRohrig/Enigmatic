require './lib/crack'
require './lib/enigma'

RSpec.describe Crack do
  # let(:crack) {Crack.new("crack is whack end", "2022-11-10")}
  let(:enigma) {Enigma.new}

  it 'exists and is a subclass of enigma, and has the shift module loaded' do
    enigma.crack("ipyqpkvstddzddawt!mmpgmfspmcpemyponc?krse", "2022-11-12")
    expect(enigma.class.included_modules).to include(Crack)
    expect(enigma.date).to eq("2022-11-12")
    enigma2 = Enigma.new
    enigma2.crack("ipyqpkvstddzddawt!mmpgmfspmcpemyponc?krse")
    expect(enigma2.date).to eq(Date.today.to_s)
  end

  it 'can find the last four characters of a message' do
    enigma.crack("ipyqpkvstddzddawt!mmpgmfspmcpemyponc?krse", "2022-11-12")
    expect(enigma.find_last_four).to eq("krse")
  end

  it 'can find the a shift' do
    enigma.crack("ipyqpkvstddzddawt!mmpgmfspmcpemyponc?krse", "2022-11-12")
    expect(enigma.find_a_shift).to eq(1)
  end

  it 'can find all possible options for the a subkey' do
    enigma.crack("ipyqpkvstddzddawt!mmpgmfspmcpemyponc?krse", "2022-11-12")
    expect(enigma.find_a_subkey).to eq([20, 47, 74])
  end

  it 'can find all possible options for the b subkey' do
    enigma.crack("ipyqpkvstddzddawt!mmpgmfspmcpemyponc?krse", "2022-11-12")
    expect(enigma.find_b_subkey).to eq([3, 30, 57, 84])
  end

  it 'can find all possible options for the c subkey' do
    enigma.crack("ipyqpkvstddzddawt!mmpgmfspmcpemyponc?krse", "2022-11-12")
    expect(enigma.find_c_subkey).to eq([5, 32, 59, 86])
  end

  it 'can find all possible options for the d subkey' do
    enigma.crack("ipyqpkvstddzddawt!mmpgmfspmcpemyponc?krse", "2022-11-12")
    expect(enigma.find_d_subkey).to eq([1, 28, 55, 82])
  end

  it 'can turn the possible keys into strings and rjust them' do
    enigma.crack("ipyqpkvstddzddawt!mmpgmfspmcpemyponc?krse", "2022-11-12")
    expect(enigma.stringify_them("a")).to eq(["20", "47", "74"])
    expect(enigma.stringify_them("b")).to eq(["03", "30", "57", "84"])
    expect(enigma.stringify_them("c")).to eq(["05", "32", "59", "86"])
    expect(enigma.stringify_them("d")).to eq(["01", "28", "55", "82"])
  end

  it 'can find the pieces of the key' do
    enigma.crack("ipyqpkvstddzddawt!mmpgmfspmcpemyponc?krse", "2022-11-12")
    expect(enigma.figure_out_key).to eq("20328")
  end

  it 'can decrypt a message with no key provided' do
    expect(enigma.crack("ipyqpkvstddzddawt!mmpgmfspmcpemyponc?krse", "2022-11-12")).to eq({:decryption => "hello instructors! how are you today? end", :key => "20328", :date => "121122"})
  end

end