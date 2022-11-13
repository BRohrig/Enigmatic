require './lib/crack'

RSpec.describe Crack do
  let(:crack) {Crack.new("crack is whack end", "2022-11-10")}

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

end