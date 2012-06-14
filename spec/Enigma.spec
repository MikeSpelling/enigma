require 'rspec'
require 'Enigma'
require 'Rotor'
require 'Reflector'

describe Enigma do

  before do
    right_3 = [
      "B", "D", "F", "H", "J", "L", "C", "P", "R", "T", "X", "V", "Z", 
      "N", "Y", "E", "I", "W", "G", "A", "K", "M", "U", "S", "Q", "O"
    ]
    @rotor3 = Rotor.new(right_3, 21, "K")

    right_2 = [
      "A", "J", "D", "K", "S", "I", "R", "U", "X", "B", "L", "H", "W",
      "T", "M", "C", "Q", "G", "Z", "N", "P", "Y", "F", "V", "O", "E"
    ]
    @rotor2 = Rotor.new(right_2, 4, "C")

    right_1 = [
      "E", "K", "M", "F", "L", "G", "D", "Q", "V", "Z", "N", "T", "O",
      "W", "Y", "H", "X", "U", "S", "P", "A", "I", "B", "R", "C", "J"
    ]
    @rotor1 = Rotor.new(right_1, -1, "M")

    @array = [24, 17, 20, 7, 16, 18, 11, 3, 15, 23, 13, 6, 14, 10, 12, 8, 4, 1, 5, 25, 2, 22, 21, 9, 0, 19] 
    @reflector = Reflector.new(@array)

    @enigma = Enigma.new(@rotor1, @rotor2, @rotor3, @reflector)
  end

  context Rotor do
    it "returns the notch" do
      @rotor3.notch.should == 21
      @rotor2.notch.should == 4
      @rotor1.notch.should == -1
    end

    it "maps forwards" do
      @rotor3.get(0, :forwards).should == 13
    end
    
    it "maps backwards" do
      @rotor1.get(25, :backwards).should == 18
    end
  end

  it "maps forwards through 3 rotors" do
    @enigma.get(3, :forwards).should == 6
  end
  
  it "maps backwards through 3 rotors" do
    @enigma.get(23, :backwards).should == 22
  end

  it "ciphers a character" do
    @enigma.cipher("E").should == "Q"
  end

  it "deciphers a character" do
    @enigma.cipher("Q").should == "E"
  end

  it "deciphers a string" do
    @enigma.cipher("QMJIDOMZWZJFJR").should == "ENIGMAREVEALED"
  end

  context Reflector do
    it "maps 0 to 24" do
      reflector = Reflector.new(@array)
      reflector.get(0).should == 24
    end
  end

end
