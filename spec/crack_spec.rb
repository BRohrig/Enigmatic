require './lib/crack'
require './lib/enigma'

RSpec.describe Crack do
  # let(:crack) {Crack.new("crack is whack end", "2022-11-10")}
  let(:enigma) {Enigma.new}

  it 'exists and is a module of enigma, and has the shift module loaded' do
    enigma.crack("ipyqpkvstddzddawt!mmpgmfspmcpemyponc?krse", "2022-11-12")
    expect(enigma.class.included_modules).to include(Crack)
    expect(enigma.date).to eq("2022-11-12")
    enigma2 = Enigma.new
    enigma2.crack("ipyqpkvstddzddawt!mmpgmfspmcpemyponc?krse")
    expect(enigma2.date).to eq(Date.today.to_s)
  end

  it 'can find the a shift' do
    enigma.crack("ipyqpkvstddzddawt!mmpgmfspmcpemyponc?krse", "2022-11-12")
    expect(enigma.find_a_shift).to eq(1)
  end

  it 'can find all possible options for the a subkey' do
    enigma.crack("ipyqpkvstddzddawt!mmpgmfspmcpemyponc?krse", "2022-11-12")
    expect(enigma.find_a_subkeys).to eq([20, 47, 74])
  end

  it 'can find all possible options for the b subkey' do
    enigma.crack("ipyqpkvstddzddawt!mmpgmfspmcpemyponc?krse", "2022-11-12")
    expect(enigma.find_b_subkeys).to eq([3, 30, 57, 84])
  end

  it 'can find all possible options for the c subkey' do
    enigma.crack("ipyqpkvstddzddawt!mmpgmfspmcpemyponc?krse", "2022-11-12")
    expect(enigma.find_c_subkeys).to eq([5, 32, 59, 86])
  end

  it 'can find all possible options for the d subkey' do
    enigma.crack("ipyqpkvstddzddawt!mmpgmfspmcpemyponc?krse", "2022-11-12")
    expect(enigma.find_d_subkeys).to eq([1, 28, 55, 82])
  end

  it 'can find the shift positions for dif length messages' do
    enigma.crack("guuvbrwzv cjvx z!iqvyijygigvwibvfjg?bnwk", "2022-11-14")
    expect(enigma.find_a_shift_position).to eq(-4)
    expect(enigma.find_b_shift_position).to eq(-3)
    expect(enigma.find_c_shift_position).to eq(-2)
    expect(enigma.find_d_shift_position).to eq(-1)
    enigma.crack("hrsketwdn gdkxw!wnsgwgvpwdsewzsoxd?kath", "2022-11-14")
    expect(enigma.find_a_shift_position).to eq(-3)
    expect(enigma.find_b_shift_position).to eq(-2)
    expect(enigma.find_c_shift_position).to eq(-1)
    expect(enigma.find_d_shift_position).to eq(-4)
    enigma.crack("rzettcyb nyzxc!knzakgbjkdzzkzzild?epto", "2022-11-14")
    expect(enigma.find_a_shift_position).to eq(-2)
    expect(enigma.find_b_shift_position).to eq(-1)
    expect(enigma.find_c_shift_position).to eq(-4)
    expect(enigma.find_d_shift_position).to eq(-3)

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
    # expect(enigma.crack("ipyqpkvstddzddawt!mmpgmfspmcpemyponc?krse", "2022-11-12")).to eq({:decryption => "hello instructors! how are you today? end", :key => "20328", :date => "121122"})
    expect(enigma.crack("guuvbrwzv cjvx z!iqvyijygigvwibvfjg?bnwk", "2022-11-14")).to eq({:decryption => "ello instructors! how are you today? end", :key => "75557", :date => "141122"})
  end

  it 'can give the output desired for the CLI method' do
    expect(enigma.cli_crack("ipyqpkvstddzddawt!mmpgmfspmcpemyponc?krse", "2022-11-12")).to eq("hello instructors! how are you today? end")
  end

end