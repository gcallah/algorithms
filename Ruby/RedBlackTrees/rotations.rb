module RedBlackTrees
  module Rotations
    def self.left_rotate(t, x)
      return if x.right == t.nil

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
      return if x.left == t.nil

      y = x.left
      x.left = y.right
      if y.right != t.nil
        y.right.p = x
      end

      y.p = x.p

      if x.p == t.nil
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
