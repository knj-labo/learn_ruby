### 1
### Getting the Most out of Core Classes

## Learning when to use core classes

things = ["foo", "bar", "baz"]
things.each do |thing|
  puts thing
end

# --

things = ThingList.new("foo", "bar", "baz")
things.each do |thing|
  puts thing
end

## Best uses for true, false, and nil objects

1.kind_of?(Integer)
# => true

# --

1 > 2
# => false

1 == 1
# => true

# --

[].first
# => nil

{1=>2}[3]
# => nil

# --

!nil
# => true

!1
# => false

# --

"a".gsub!('b', '')
# => nil
[2, 4, 6].select!(&:even?)# => nil

["a", "b", "c"].reject!(&:empty?)# => nil

# --

string = "..."
if string.gsub!('a', 'b')
  # string was modified
end

# --

string.
  gsub!('a', 'b').
  downcase!

# --

@cached_value ||= some_expression
# or
cache[:key] ||= some_expression

# --

if defined?(@cached_value)
  @cached_value
else
  @cached_value = some_expression
end

# --

cache.fetch(:key){cache[:key] = some_expression}

## Different numeric types for different needs

10.times do
  # executed 10 times
end

# --

5 / 10
# => 0

7 / 3
# => 2

# --

5 / 10r # or Rational(5, 10) or 5 / 10.to_r
# => (1/2)

7.0 / 3
# => 2.3333333333333335

# --

f = 1.1
v = 0.0
1000.times do
  v += f
end
v
# => 1100.0000000000086

# --

f = 1.109375
v = 0.0
1000.times do
  v += f
end
v
# => 1109.375

# --

f = 1.1r
v = 0.0r
1000.times do
  v += f
end
v
# => (1100/1)

# --

f = 1.109375r
v = 0.0r
1000.times do
  v += f
end
v
# => (8875/8)
v.to_f
# => 1109.375

# --

v = BigDecimal(1)/3
v * 3
# => 0.999999999999999999e0

# --

f = BigDecimal(1.1, 2)
v = BigDecimal(0)
1000.times do
  v += f
end
v
# => 0.11e4
v.to_s('F')
# => "1100.0"

# --

f = BigDecimal(1.109375, 7)
v = BigDecimal(0)
1000.times do
  v += f
end
v
# => 0.1109375e4
v.to_s('F')
# => "1109.375"