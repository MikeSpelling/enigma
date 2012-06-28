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
      forwards  = @rotor_1.cipher(@rotor_2.cipher(@rotor_3.cipher(character)))
      reflected = @reflector.cipher(forwards)
      backwards = @rotor_3.decipher(@rotor_2.decipher(@rotor_1.decipher(reflected)))
    end.join("")
  end

  private
  def rotate
    if @rotor_1.offset == @rotor_1.notch
          @rotor_2.rotate
          @rotor_3.rotate
        end
    if @rotor_2.offset == @rotor_2.notch
      @rotor_1.rotate
    end
    if @rotor_3.offset == @rotor_3.notch
      @rotor_2.rotate
    end    
    @rotor_3.rotate    
  end
  
end