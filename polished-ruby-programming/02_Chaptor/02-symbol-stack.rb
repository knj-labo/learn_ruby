# `class SymbolStack` starts the definition of the SymbolStack class.
class SymbolStack
  # def initialize defines the constructor method
  # `initialize`, which is called when a new instance of the `SymbolStack` class is created.
  def initialize
    # `@stack = []` initializes an instance variable called `@stack`,
    # which will store the elements in the stack using an array.
    @stack = []
  end

  # `def push(symbol)` defines a method called `push` that takes a single argument,
  # `symbol`, which represents the symbol to be added to the stack.
  def push(symbol)
    # raise TypeError, "Expected a Symbol, got #{symbol.class}" unless symbol.is_a?(Symbol) raises a TypeError
    # if the given symbol is not an instance of the Symbol class.
    raise TypeError, "Expected a Symbol, got #{symbol.class}" unless symbol.is_a?(Symbol)
    # `@stack.push([symbol, clock_time])` adds an array containing the given symbol
    # and the current clock time to the end of the `@stack` array.
    @stack.push([symbol, clock_time])
  end


  # `def pop` defines a method called pop that doesn't take any arguments
  # and is responsible for removing and returning the last symbol added to the stack along with the time it stayed on the stack.
  def pop
    # `system, pushed_at = @stack.pop` removes and deconstructs the last element from the `@stack` array into the `system` and `pushed_at` variables.
    system, pushed_at = @stack.pop
    # `[system, clock_time - pushed_at]` returns an array containing the popped symbol and the time it stayed on the stack.
    [system, clock_time - pushed_at]
  end

  # `private def clock_time` defines a private method called `clock_time`,
  # which can only be called within the `SymbolStack` class.
  private def clock_time
    # `Process.clock_gettime(Process::CLOCK_MONOTONIC)` returns the current time in seconds as a floating-point number
    # from a monotonic clock, which is not affected by system time changes.
    Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end
end