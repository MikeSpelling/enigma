class Enigma
  def initialize(rotor1, rotor2, rotor3, reflector)
    @rotor1 = rotor1
    @rotor2 = rotor2
    @rotor3 = rotor3
    @reflector = reflector
  end

  def get(index, direction)
    if (direction == :forwards)
      @rotor1.get(@rotor2.get(@rotor3.get(index, direction), direction), direction)
    elsif (direction == :backwards)
      @rotor3.get(@rotor2.get(@rotor1.get(index, direction), direction), direction)
    end
  end

  def cipher(string)
    ciphered_string = ""
    string.split(//).each do |character|
      @rotor3.rotate

      number = ("A".."Z").to_a.index character
      forward = get(number, :forwards)
      reflect = @reflector.get(forward)
      result = get(reflect, :backwards)
      ciphered_string.concat(("A".."Z").to_a[result])

      if @rotor3.offset == @rotor3.notch
        @rotor2.rotate
      end
      
      if @rotor2.offset == @rotor2.notch
        @rotor1.rotate
      end

    end
    ciphered_string
  end
end



