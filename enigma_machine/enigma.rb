class Enigma

  def initialize(rotor_numbers, reflector_number)
    @alphabet  = ("A".."Z").to_a
    rotor1 = Rotor.new("EKMFLGDQVZNTOWYHXUSPAIBRCJ", "Q", "M")
    rotor2 = Rotor.new("AJDKSIRUXBLHWTMCQGZNPYFVOE", "E", "C")
    rotor3 = Rotor.new("BDFHJLCPRTXVZNYEIWGAKMUSQO", "V", "K")
    all_rotors = [rotor1, rotor2, rotor3]
    
    reflector1 = Rotor.new("YRUHQSLDPXNGOKMIEBFZCWVJAT")
    all_reflectors = [reflector1]
    
    @rotors = []
    rotor_numbers.each do |index|
      @rotors << all_rotors[index-1]
    end
    @reflector = all_reflectors[reflector_number-1]
  end

  def cipher(text)
    text.upcase.split("").map do |character|
      rotate
      @rotors.reverse.each do |rotor|
        character = rotor.cipher(character)
      end
      character = @reflector.cipher(character)
      @rotors.each do |rotor|
        character = rotor.decipher(character)
      end
      character
    end.join("")
  end

  private
  def rotate
    @rotors.size.times do |count|
      # First rotor rotates all if at notch
      if count == 0  and @rotors[0].offset == @rotors[0].notch
        @rotors.each do |rotor|
          rotor.rotate
        end  
        
      else
        @rotors[count-1].rotate if @rotors[count].offset == @rotors[count].notch
        @rotors[count].rotate if count == @rotors.size-1 # Last rotor always rotates
      end
    end  
  end
  
end