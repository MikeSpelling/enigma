class Rotor
  attr_accessor :notch, :offset
  def initialize(right, notch, offset_letter)
    @right = right * 2
    @left = ("A".."Z").to_a * 2
    @offset = @left.index(offset_letter)
    @notch = notch
  end

  def get(index, direction)
    if direction == :forwards
      (@left.index(@right[(index + @offset) % 26]) - @offset) % 26
    elsif direction == :backwards
      (@right.index(@left[(index + @offset) % 26]) - @offset) % 26
    end
  end

  def rotate
    @offset += 1
  end
end
