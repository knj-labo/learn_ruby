# defined?(a) returns nil because a is not yet defined.
defined?(a) # nil

# a = 1 assigns the value 1 to a.
a = 1

# defined?(a) returns "local-variable" because a is now defined as a local variable.
defined?(a) # 'local-variable'

# define a new anonymous module M and within its scope:
M = Module.new do
  # a. defined?(a) returns "local-variable" because a is accessible within the module scope.
  defined?(a) # 'local-variable'
  # b. a = 2 reassigns the value of a to 2.
  a = 2
  # c. define a new anonymous class C within the module and within its scope:
  self::C = Class.new do
    # i. defined?(a) returns "local-variable" because a is accessible within the class scope.
    defined?(a) # 'local-variable'
    # ii. a = 3 reassigns the value of a to 3.
    a = 3
    # iii. define a new method m within the class and within its scope:
    define_method(:m) do
      # - defined?(a) returns "local-variable" because a is accessible within the method scope.
      defined?(a) # 'local-variable'
      # - a = 4 reassigns the value of a to 4.
      a = 4
    end
    # iv. a returns 3 since the value of a within the class scope is 3.
    a # 3
  end
  # d. a returns 3 since the value of a within the module scope is 3.
  a # 3
end
# a returns 3 since the value of a outside the module scope is still 3.
a # 3

# create a new instance of M::C and call the method m:
M::C.new.m

# after executing the m method, the value of a changes to 4:
a # 4