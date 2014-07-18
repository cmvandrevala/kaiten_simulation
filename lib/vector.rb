class Vector
  
  def x
    return @elements[0]
  end
  
  def y
    return @elements[1]
  end
  
  def z
    return @elements[2]
  end
  
  def square
    return Vector[@elements[0]**2, @elements[1]**2, @elements[2]**2]
  end

end