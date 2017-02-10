module BinarySearchTree
  class << self
    # TODO: Add documentation on how to install GRAPHVIZ AND RUBY-GRAPHVIZ GEM
    # Public: Same as tree_insert method only here this generates a graphical image(.PNG)
    #         for tree visualization. Added a new method to not mix the actual logic with
    #         this gem specific code
    #
    # NOTE: Images are generated at a location where the code is executed
    #       Eg: If you are at /Users/whoami/Documents directory and ran the code
    #           by executing ruby /algorithms/ruby/binary_trees/binary_tree.rb, then
    #           images will be generated at /Users/whoami/Documents location and not
    #           at the location of the ruby file
    #
    # t - Tree structure
    # z - Node to be INSERTED
    # g - GraphViz instance to draw and update the graph
    def tree_insert_graphical(t, z, g)
      return if (t.nil? || z.nil? || g.nil?)
      y = nil
      x = t.root
      while !x.nil?
        y = x
        (z.key < x.key) ? (x = x.left) : (x = x.right)
      end
      z.p = y

      # TODO: Document this
      if y.nil?
        t.root = z
        g.add_nodes( "#{z.key}", "shape" => "record", "label" => "<left> left|<key> #{z.key}|<p> p|<right> right" )
      elsif z.key < y.key
        y.left = z
        g.add_nodes( "#{y.key}", "shape" => "record", "label" => "<left> left|<key> #{y.key}|<p> parent|<right> right" )
        g.add_nodes( "#{z.key}", "shape" => "record", "label" => "<left> left|<key> #{z.key}|<p> parent|<right> right" )

        g.add_edges( { "#{y.key}" => :left}, {"#{z.key}" => :key} )
        g.add_edges( { "#{z.key}" => :p}, {"#{y.key}" => :key} )
      else
        y.right = z
        g.add_nodes( "#{y.key}", "shape" => "record", "label" => "<left> left|<key> #{y.key}|<p> parent|<right> right" )
        g.add_nodes( "#{z.key}", "shape" => "record", "label" => "<left> left|<key> #{z.key}|<p> parent|<right> right" )

        g.add_edges( { "#{y.key}" => :right}, {"#{z.key}" => :key} )
        g.add_edges( { "#{z.key}" => :p}, {"#{y.key}" => :key} )
      end
    end
  end
end
