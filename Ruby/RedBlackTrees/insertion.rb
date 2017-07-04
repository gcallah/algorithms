require_relative './rotations'

module RedBlackTrees
  class << self
    include RedBlackTrees::Rotations

    def rb_insert(t, z)
      y = nil
      x = t.root

      while x != nil
        y = x
        x = z.key < x.key ? x.left : x.right
      end

      z.p = y

      if y == nil
        t.root = z
      elsif z.key < y.key
        y.left = z
      else
        y.right = z
      end

      z.left = nil
      z.right = nil
      z.color = "RED"

    end

    def rb_insert_fixup(t, z)
      while z.p.color == "RED"
        if z.p == z.p.p.left
          y = z.p.p.right
          if y.color ==  "RED"
            z.p.color = "BLACK"
            y.color = "BLACK"
            z.p.p.color = "RED"
            z = z.p.p
          else
            if z == z.p.right
              z = z.p
              left_rotate(t, z)
            end
            z.p.color = "BLACK"
            z.p.p.color = "RED"
            right_rotate(t, z.p.p)
          end
        else
          y = z.p.p.left
          if y.color == "RED"
            z.p.color = "BLACK"
            y.color = "BLACK"
            z.p.p.color = "RED"
            z = z.p.p
          else
            if z == z.p.left
              z = z.p
              right_rotate(t, z)
            end
            z.p.color = "BLACK"
            z.p.p.color = "RED"
            left_rotate(t, z.p.p)
          end
        end
      end
    end
  end
end
