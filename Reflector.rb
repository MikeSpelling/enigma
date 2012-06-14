class Reflector
  def initialize(mapper)
    @mapper = mapper
  end
  
  def get(number)
    @mapper[number]
  end
end
