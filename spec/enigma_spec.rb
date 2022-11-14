require './lib/enigma'

RSpec.describe Enigma do
  
  let(:enigma) {Enigma.new}

  it 'exists' do
    expect(enigma).to be_a(Enigma)
  end

  it 'can encrypt a message' do
    expect(enigma.encrypt("I am a happy purple muffin bunny", "12345", "11-Nov-2022")).to eq({:encryption => "bdphteocutdtttimiptvfyuabroxnrbt", :key => "12345", :date => "111122"})
  end

  it 'can decrypt a message' do
    expect(enigma.decrypt("bdphteocutdtttimiptvfyuabroxnrbt", "12345", "11-Nov-2022")).to eq({:decryption => "i am a happy purple muffin bunny", :key  => "12345", :date => "111122"})
  end

  it 'can encrypt/decrypt a message with special characters' do
    expect(enigma.encrypt("I am a happy purple muffin bunny!", "12345", "11-Nov-2022")).to eq({:encryption => "bdphteocutdtttimiptvfyuabroxnrbt!", :key => "12345", :date => "111122"})
    expect(enigma.decrypt("bdphteocutdtttimiptvfyuabroxnrbt!", "12345", "11-Nov-2022")).to eq({:decryption => "i am a happy purple muffin bunny!", :key => "12345", :date => "111122"})
  end


end