require './lib/crack'

RSpec.describe Crack do
  let(:crack) {Crack.new("2022-11-10")}

  it 'exists and is a subclass of enigma, and has the shift module loaded' do
    expect(crack).to be_a(Crack)
    expect(crack.class.superclass).to eq(Enigma)
    expect(crack.class.included_modules).to include(Shift)
    expect(crack.date).to eq("2022-11-10")
    crack2 = Crack.new
    expect(crack2.date).to eq(Date.today.to_s)
  end

  it 'can use the date to find how to reverse the offset' do
    expect(crack.reverse_offsets).to eq({:a => -8,
                                        :b => -8,
                                        :c => -8,
                                        :d => -4})
  end

end