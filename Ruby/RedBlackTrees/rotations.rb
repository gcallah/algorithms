module RedBlackTrees
  module Rotations
    def left_rotate(t, x)
      return if x.right == nil

      y = x.right
      x.right = y.left

      if y.left != nil
        y.left.p = x
      end

      y.p = x.p

      if x.p == nil
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
      return if x.left == nil

      y = x.left
      x.left = y.right
      if y.right != nil
        y.right.p = x
      end

      y.p = x.p

      if x.p == nil
        t.root = y
      elsif x == x.p.right
        x.p.right = y
      else
        x.p.left = y
      end

      y.right = x
      x.p = y
    end
  end
end
