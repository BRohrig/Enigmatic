require './lib/shift'
require './lib/enigma'
require 'date'

RSpec.describe Shift do
  let(:enigma) {Enigma.new}

  it 'is a shift and has attributes' do
    allow(enigma).to receive(:key) {"54321"}
    expect(enigma.key).to eq("54321")
  end

  it 'can have a random key generated if none passed' do
    enigma.encrypt("I like cheese")
    expect(enigma.key.length).to eq(5)
    expect(enigma.key).to be_a(String)
    expect(enigma.key).to be_between("00000","99999").inclusive
  end

  it 'can break a five digit key into subkeys' do
    enigma.encrypt("I like cheese", "12345")
    expect(enigma.subkeys).to eq({ :a => "12",
                                      :b => "23",
                                      :c => "34",
                                      :d => "45"
                                    })
  end

  it 'has a date attribute that is either an argument or defaults to today' do
    enigma.encrypt("I like cheese", "12345")
    expect(enigma.date).to eq(Date.today.to_s)
    
    enigma.encrypt("I LOVE cheese", "12349", "2005-06-25")
    expect(enigma.date).to eq("2005-06-25")
  end

  it 'has a method to create an offset' do
    enigma.decrypt("cheese is amazing", "45839", "2022-11-10")
    expect(enigma.create_offset).to eq("8884")
  end

  it 'has a method to combine key and offset to get shift' do
    enigma.encrypt("I am the cheeseman", "12345", "2022-11-10")
    expect(enigma.find_shifts).to eq({  :A => 20,
                                        :B => 31,
                                        :C => 42,
                                        :D => 49})
  end
end