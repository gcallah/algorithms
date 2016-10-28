class Integer
  def parent
    ( self - 1 ) / 2
  end

  def left
    ( 2 * self ) + 1
  end

  def right
    ( 2 * self ) + 2
  end
end
