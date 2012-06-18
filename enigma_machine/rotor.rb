class Rotor
  attr_accessor :offset, :notch

  def initialize(ciphabet, notch = nil, offset = "A")
    @alphabet = ("A".."Z").to_a
    @ciphabet = ciphabet.split ""
    @notch    = @alphabet.index(notch)
    @offset   = @alphabet.index(offset)
  end

  def cipher(number)
    index = (number + @offset) % @ciphabet.length
    (@alphabet.index(@ciphabet[index]) - @offset) % @ciphabet.length
  end

  def decipher(number)
    index = (number + @offset) % @alphabet.length
    (@ciphabet.index(@alphabet[index]) - @offset) % @alphabet.length
  end

  def rotate(times = 1)
    @offset += times
  end
end