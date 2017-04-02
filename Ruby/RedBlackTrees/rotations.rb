def left_rotate(t, x)
  y = x.right
  x.right = y.left

  if y.left != t.nil
    y.left.p = x
  end

  y.p = x.p

  if x.p == t.nil
    t.root = y
  elsif x == x.p.left
    x.p.left = y
  else
    x.p.right = y
  end

  y.left = x
  x.p = y
end

def right_rotate(t, x)

end
