class HTMLTable
  class Element
    # set_type class method to set the element type
    def self.set_type(type)
      define_method(:type){type}
    end
    # initialize method to set the element data.
    def initialize(data)
      @data = data
    end
    # The to_s method generates the HTML string for the element.
    def to_s
      "<#{type}>#{@data}</#{type}>"
    end
  end
  # This block of code uses metaprogramming to create a specific class
  # for each HTML element type (table, tbody, tr, and td)
  %i"table tbody tr td".each do |type|
    klass = Class.new(Element)
    klass.set_type(type)
    const_set(type.capitalize, klass)
  end
end