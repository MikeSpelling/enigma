class Enigma

  def initialize(rotor_numbers = [1], offsets = "A", reflector_number = 1, plugboard = nil)
      
    @default_plugboard = {"A"=>"A", "B"=>"B", "C"=>"C", "D"=>"D", "E"=>"E", "F"=>"F", "G"=>"G", "H"=>"H", "I"=>"I", "J"=>"J", "K"=>"K", "L"=>"L", 
      "M"=>"M", "N"=>"N", "O"=>"O", "P"=>"P", "Q"=>"Q", "R"=>"R", "S"=>"S", "T"=>"T", "U"=>"U", "V"=>"V", "W"=>"W", "X"=>"X", "Y"=>"Y", "Z"=>"Z"}
    
    rotor1 = Rotor.new("EKMFLGDQVZNTOWYHXUSPAIBRCJ", "Q")
    rotor2 = Rotor.new("AJDKSIRUXBLHWTMCQGZNPYFVOE", "E")
    rotor3 = Rotor.new("BDFHJLCPRTXVZNYEIWGAKMUSQO", "V")
    rotor4 = Rotor.new("QAZWSXEDCRFVTGBYHNUJMIKOLP", "A")
    rotor5 = Rotor.new("POIUYTREWQLKJHGFDSAMNBVCXZ", "Y")
    @all_rotors = [rotor1, rotor2, rotor3, rotor4, rotor5]
    
    reflector1 = Rotor.new("YRUHQSLDPXNGOKMIEBFZCWVJAT")
    reflector2 = Rotor.new("PLOKMIJNUHBYGVTFCRDXESZWAQ")
    reflector3 = Rotor.new("LKJHGFDSAMNBVCXZPOIUYTREWQ")
    reflector4 = Rotor.new("QWERTYUIOPASDFGHJKLZXCVBNM")
    reflector5 = Rotor.new("ZAQCDEXSWVFRBGTMJUNHYKIPLO")
    @all_reflectors = [reflector1, reflector2, reflector3, reflector4, reflector5]
    
    @offsets = offsets
    @reflector = @all_reflectors[reflector_number-1]
    set_rotors(rotor_numbers, offsets)    
    set_plugboard(plugboard)   
  end

  def cipher(text)
    text.upcase.split("").map do |character|
      rotate
      character = @plugboard[character]
      @rotors.reverse.each do |rotor|
        character = rotor.cipher(character)
      end
      character = @reflector.cipher(character)
      @rotors.each do |rotor|
        character = rotor.decipher(character)
      end
      @plugboard[character]
    end.join("")
  end
  
  def set_rotors(rotor_numbers, offsets)
    @offsets = offsets
    @rotors = []
    rotor_numbers.each_with_index do |rotor_number, index|
      rotor = @all_rotors[rotor_number-1]
      rotor.set_offset offsets[index]
      @rotors << rotor
    end
  end
  
  def set_reflector(reflector_number)
    @reflector = @all_reflectors[reflector_number-1]
  end
  
  def set_plugboard(settings)
    plugboard = @default_plugboard
    unless settings.nil?    
      settings.split(",").each do |pair|
        chars = pair.split("-")
        plugboard[chars[0].upcase] = chars[1].upcase
        plugboard[chars[1].upcase] = chars[0].upcase
      end
    end
    @plugboard = plugboard
  end
  
  def reset
    @rotors.each_with_index do |rotor, index|
      rotor.set_offset @offsets[index]
    end
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