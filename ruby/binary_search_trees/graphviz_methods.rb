require_relative './node'
require_relative './tree'

# Comment the below line while running the tests. Installation steps for ruby-graphviz
# and GraphViz will be added soon to a readme file
require 'ruby-graphviz'

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

      def build_visualization_images
        node_a = Node.new('A', nil, nil, nil)
        node_b = Node.new('B', nil, nil, nil)
        node_c = Node.new('C', nil, nil, nil)
        node_d = Node.new('D', nil, nil, nil)
        node_e = Node.new('E', nil, nil, nil)
        node_f = Node.new('F', nil, nil, nil)
        node_g = Node.new('G', nil, nil, nil)
        node_h = Node.new('H', nil, nil, nil)
        node_i = Node.new('I', nil, nil, nil)
        node_j = Node.new('J', nil, nil, nil)

        tree_graphical = Tree.new(nil)

        g = GraphViz.new( :G, :type => :digraph )

        p "--------------------  BEGIN GENERATING IMAGES -------------------- "
        [node_f, node_b, node_g, node_a, node_d, node_c, node_e, node_i, node_h].each_with_index do |x, i|
          tree_insert_graphical(tree_graphical, x, g) # For image generation
          g.output( :png => "Order #{i.to_i} - Inserted #{x.key}.png", :canon => nil)
        end
        p "                              F                      "
        p "                            // \\                    "
        p "                           B     G                   "
        p "                         // \\    \\                 "
        p "                         A   D     I                 "
        p "                           // \\ //                  "
        p "                           C   E H                   "

        p "--------------------  END GENERATING IMAGES -------------------- "
      end
    end
  end
end
