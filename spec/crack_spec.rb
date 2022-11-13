require './lib/crack'

RSpec.describe Crack do
  let(:crack) {Crack.new("crack is whack end", "2022-11-10")}
  let(:crack2) {Crack.new("ipyqpkvstddzddawt!mmpgmfspmcpemyponc?krse", "2022-11-12")}

  it 'exists and is a subclass of enigma, and has the shift module loaded' do
    expect(crack).to be_a(Crack)
    expect(crack.class.superclass).to eq(Enigma)
    expect(crack.class.included_modules).to include(Shift)
    expect(crack.date).to eq("2022-11-10")
    crack2 = Crack.new("crack is still whack end")
    expect(crack2.date).to eq(Date.today.to_s)
  end

  it 'can use the date to find how to reverse the offset' do
    expect(crack.reverse_offsets).to eq({:a => -8,
                                        :b => -8,
                                        :c => -8,
                                        :d => -4})
  end

  it 'can find the last four characters of a message' do
    expect(crack.find_last_four).to eq(" end")
  end

  it 'can find the index positions of the last four' do
    expect(crack.find_last_indexes).to eq([26, 4, 13, 3])
  end 

  it 'can find the index differences between the last four and the expected last four' do
    expect(crack.find_raw_shifts).to eq([0, 0, 0, 0])
    expect(crack2.find_raw_shifts).to eq([11, 13, 5, 1])
  end

  xit 'can find all possible options for the A key' do
    expect(crack.find_a_key).to eq([0, 27, 54, 81])
    expect(crack2.find_a_key).to eq([11, 38, 65, 99])
  end

end