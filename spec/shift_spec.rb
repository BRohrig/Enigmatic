require './lib/shift'
require 'date'

RSpec.describe Shift do
  let(:shift) {Shift.new}
  let(:letters) {("a".."z").to_a << " "}

  it 'is a shift and a subclass of enigma and has attributes' do
    expect(shift).to be_a(Shift)
    expect(shift.alphabet).to eq(letters)
    expect(shift.key).to eq("")
  end

  it 'can create a new key' do
    shift.new_key
    
    expect(shift.key.length).to eq(5)
    expect(shift.key).to be_a(String)
  end

  it 'has a date attribute that is either an argument or defaults to today' do
    expect(shift.date).to eq(Date.today)
    
    new_shift = Shift.new(Date.parse("2005-06-25"))
    allow(new_shift).to receive(:date) {"2005-06-25"}
    expect(new_shift.date).to eq("2005-06-25")
  end

  it 'has a method to create an offset' do
    expect(shift.create_offset).to eq()

  end

end