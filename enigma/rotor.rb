class Rotor
  
  attr_accessor :notch, :offset
  
  def initialize(right, notch_letter, offset_letter)
    @left = ("A".."Z").to_a * 2
    @right = right * 2
    @offset = @left.index(offset_letter)
    if notch_letter.nil?
      @notch = nil
    else
      @notch = @left.index(notch_letter)
    end
  end

  def map(index, direction)
    if direction == :forwards
      letter = @right[(index + @offset) % 26]
      (@left.index(letter) - @offset) % 26
        
    elsif direction == :backwards
      letter = @left[(index + @offset) % 26]
      (@right.index(letter) - @offset) % 26
    end
  end

  def rotate
    @offset += 1
  end
  
end