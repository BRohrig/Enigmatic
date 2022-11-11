require './lib/enigma'

RSpec.describe Enigma do
  
  let(:enigma) {Enigma.new({:message => "I am a happy purple muffin bunny", :key => "12345", :date => "11-Nov-2022"})}

  it 'exists and has a message and shift attributes' do
    
    expect(enigma).to be_a(Enigma)
    expect(enigma.message).to eq("I am a happy purple muffin bunny")
    expect(enigma.shift).to be_a(Hash)
    expect(enigma.shift).to eq({:A => 20,
                                :B => 31,
                                :C => 42,
                                :D => 49})
  end

  it 'can encrypt a message' do
    expect(enigma.encrypt).to eq("bdphteocutdtttimiptvfyuabroxnrbt")
  end


end