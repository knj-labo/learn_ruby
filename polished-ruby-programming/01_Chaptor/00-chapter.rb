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