require './lib/shift'
require 'date'

RSpec.describe Shift do
  let(:shift) {Shift.new}

  it 'is a shift and has attributes' do
    allow(shift).to receive(:key) {"54321"}
    expect(shift).to be_a(Shift)
    expect(shift.key).to eq("54321")
  end

  it 'can have a key passed in' do
    new_shift = Shift.new({:key => "12345"})
    expect(new_shift.key).to eq("12345")
  end

  it 'can have a random key generated if none passed' do
    expect(shift.key.length).to eq(5)
    expect(shift.key).to be_a(String)
    expect(shift.key).to be_between("00000","99999").inclusive
  end

  it 'can break a five digit key into subkeys' do
    new_shift = Shift.new({:key => "12345"})
    expect(new_shift.subkeys).to eq({ :a => "12",
                                      :b => "23",
                                      :c => "34",
                                      :d => "45"
                                    })
  end

  it 'has a date attribute that is either an argument or defaults to today' do
    expect(shift.date).to eq(Date.today.to_s)
    
    new_shift = Shift.new({:date => Date.parse("2005-06-25"), :key => "12349"})
    allow(new_shift).to receive(:date) {"2005-06-25"}

    expect(new_shift.date).to eq("2005-06-25")
  end

  it 'has a method to create an offset' do
    new_shift = Shift.new({:key => "45839", :date => "2022-11-10"})

    expect(new_shift.create_offset).to eq("8884")
  end

  it 'has a method to combine key and offset to get shift' do
    new_shift = Shift.new({:key => "12345", :date => "2022-11-10"})

    expect(new_shift.find_shifts).to eq({ :A => 20,
                                          :B => 31,
                                          :C => 42,
                                          :D => 49})
  end
end