class Enigma
  def initialize(rotor_1, rotor_2, rotor_3, reflector)
    @alphabet  = ("A".."Z").to_a
    @rotor_1   = rotor_1
    @rotor_2   = rotor_2
    @rotor_3   = rotor_3
    @reflector = reflector
  end

  def cipher(text)
    text.split("").map do |character|
      rotate
      as_number = @alphabet.index(character)
      forwards  = @rotor_1.cipher(@rotor_2.cipher(@rotor_3.cipher(as_number)))
      reflected = @reflector.cipher(forwards)
      backwards = @rotor_3.decipher(@rotor_2.decipher(@rotor_1.decipher(reflected)))
      as_char   = @alphabet.to_a[backwards]
    end.join("")
  end

  private
  def rotate
    if @rotor_3.offset == @rotor_3.notch
      @rotor_2.rotate
    end
    
    @rotor_3.rotate
    
    if @rotor_2.offset == @rotor_2.notch
      @rotor_2.rotate
      @rotor_1.rotate
    end
  end
end