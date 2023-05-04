LineItem = Struct.new(:name, :price, :quantity)

class Invoice
  def initialize(line_items, tax_rate)
    @line_items = line_items
    @tax_rate = tax_rate
    # This line initializes a new hash for the @cache instance variable, which will store memoized values.
    @cache = {}
    # makes the Invoice object immutable after initialization.
    # It prevents any changes to the object, such as adding or modifying instance variables, after the object is created.
    freeze
  end

  def total_tax
    # checks if the :total_tax key exists in the @cache hash.
    # If it does, the memoized value is returned, preventing recalculation if the method is called multiple times.
    return @cache[:total_tax] if @cache.key?(:total_tax)
    @cache[:total_tax] = @tax_rate *
      @line_items.sum do |item|
        item.price * item.quantity
      end
  end
end