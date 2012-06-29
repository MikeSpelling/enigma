class Rotor
  attr_reader :offset, :notch

  def initialize(ciphabet, notch = nil, offset = "A")
    @alphabet = ("A".."Z").to_a
    @ciphabet = ciphabet.split ""
    @notch    = @alphabet.index(notch)
    @offset   = @alphabet.index(offset)
  end

  def cipher(character)
    number = @alphabet.index(character)
    index = (number + @offset) % @ciphabet.length
    output_number = (@alphabet.index(@ciphabet[index]) - @offset) % @ciphabet.length
    @alphabet[output_number]
  end

  def decipher(character)
    number = @alphabet.index(character)
    index = (number + @offset) % @alphabet.length
    output_number = (@ciphabet.index(@alphabet[index]) - @offset) % @alphabet.length
    @alphabet[output_number]
  end

  def rotate(times = 1)
    @offset += times
  end
  
  def set_offset(character)
    @offset = @alphabet.index(character)
  end
end