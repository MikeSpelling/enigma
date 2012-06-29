class Enigma

  def initialize(rotors, reflector)
    @alphabet  = ("A".."Z").to_a
    @rotors = rotors
    @reflector = reflector
  end

  def cipher(text)
    text.split("").map do |character|
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