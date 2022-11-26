# The Story So Far
Recall that hashes are collections of key-value pairs, where a unique key is associated with some value. For example:
```ruby
breakfast = {
  "bacon" => "tasty",
  "eggs" => "tasty",
  "oatmeal" => "healthy",
  "OJ" => "juicy"
}
```
Remember that keys must be unique, but values can repeat. That’s why we can have more than one key share the value “tasty.”)

We can create hashes several ways, but two of the most popular are

```ruby
hash literal notation:
  new_hash = { "one" => 1 }
and
```
2. hash constructor notation:
```ruby
new_hash = Hash.new
```
## Iterating Over Hashes
We can also iterate over hashes using the .each method. For example, we could do
```ruby
matz.each do |key, value|
  puts matz[key]
end
```
This will print out a list of values from my_hash, each on its own line.

## Setting Your Own Default
You don’t have to settle for nil as a default value, however. If you create your hash using the Hash.new syntax, you can specify a default like so:
```ruby
my_hash = Hash.new("Trady Blix")
```
Now if you try to access a nonexistent key in my_hash, you’ll get `"Trady Blix"` as a result.

## A Key of a Different Color
We can certainly use strings as Ruby hash keys; as we’ve seen, there’s always more than one way to do something in Ruby. However, the Rubyist’s approach would be to use symbols.

## What's a Symbol?
You can think of a Ruby symbol as a sort of name. It’s important to remember that symbols aren’t strings:
```ruby
"string" == :string # false
```
Above and beyond the different syntax, there’s a key behavior of symbols that makes them different from strings. While there can be multiple different strings that all have the same value, there’s only one copy of any particular symbol at a given time.

## Symbol Syntax
Symbols always start with a colon (:). They must be valid Ruby variable names, so the first character after the colon has to be a letter or underscore (_); after that, any combination of letters, numbers, and underscores is allowed.

Make sure you don’t put any spaces in your symbol name—if you do, Ruby will get confused.
```ruby
:my symbol # Don't do this!
:my_symbol # Do this instead.
```

## What are Symbols Used For?
Symbols pop up in a lot of places in Ruby, but they’re primarily used either as hash keys or for referencing method names. (We’ll see how symbols can reference methods in a later lesson.)
```ruby
sounds = {
  :cat => "meow",
  :dog => "woof",
  :computer => 10010110,
}
```
Symbols make good hash keys for a few reasons:

1. They’re immutable, meaning they can’t be changed once they’re created;
2. Only one copy of any symbol exists at a given time, so they save memory;
3. Symbol-as-keys are faster than strings-as-keys because of the above two reasons.

## Converting Between Symbols and Strings
Converting between strings and symbols is a snap.
```ruby
:sasquatch.to_s
# ==> "sasquatch"

"sasquatch".to_sym
# ==> :sasquatch
```
The `.to_s` and `.to_sym` methods are what you’re looking for!
```ruby
strings = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]

# Add your code below!
symbols = []
strings.each do |string|
  symbols.push(string.to_sym)
end
```

## Many Paths to the Same Summit
Remember, there are always many ways of accomplishing something in Ruby. Converting strings to symbols is no different!

Besides using `.to_sym`, you can also use `.intern`. This will internalize the string into a symbol and works just like `.to_sym`:
```ruby
"hello".intern
# ==> :hello
```
When you’re looking at someone else’s code, you might see `.to_sym` or `.intern` (or both!) when converting strings to symbols.
```ruby
strings = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]

# Add your code below!
symbols = []
strings.each do |string|
  symbols.push(string.intern)
end
```
## All Aboard the Hash Rocket!
The hash syntax you’ve seen so far (with the => symbol between keys and values) is sometimes nicknamed the hash rocket style.
```ruby
numbers = {
  :one => 1,
  :two => "two",
  :three => 3,
}
```
This is because the => looks like a tiny rocket!

Let’s build a hash from the ground up using symbols as keys.

## The Hash Rocket Has Landed
However, the hash syntax changed in Ruby 1.9. Just when you were getting comfortable!

The good news is that the changed syntax is easier to type than the old hash rocket syntax, and if you’re used to JavaScript objects or Python dictionaries, it will look very familiar:
```ruby
new_hash = {
one: 1,
two: 2,
three: 3
}
```
The two changes are:

You put the colon at the end of the symbol, not at the beginning;
You don’t need the hash rocket anymore.
It’s important to note that even though these keys have colons at the end instead of the beginning, they’re still symbols!
```ruby
puts new_hash
# => { :one => 1, :two => 2, :three => 3 }
```
From now on, we’ll use the 1.9 hash syntax when giving examples or providing default code. You’ll want to be familiar with the hash rocket style when reading other people’s code, which might be older.

## Dare to Compare
We mentioned that hash lookup is faster with symbol keys than with string keys. Here, we’ll prove it!

The code in the editor uses some new syntax, so don’t worry about understanding all of it just yet. It builds two alphabet hashes: one that pairs string letters with their place in the alphabet ( “a” with 1, “b” with 2…) and one that uses symbols (:a with 1, :b with 2…). We’ll look up the letter “r” 100,000 times to see which process runs faster!

It’s good to keep in mind that the numbers you’ll see are only fractions of a second apart, and we did the hash lookup 100,000 times each. It’s not much of a performance increase to use symbols in this case, but it’s definitely there!
```ruby
require 'benchmark'

string_AZ = Hash[("a".."z").to_a.zip((1..26).to_a)]
symbol_AZ = Hash[(:a..:z).to_a.zip((1..26).to_a)]

string_time = Benchmark.realtime do
  100_000.times { string_AZ["r"] }
end

symbol_time = Benchmark.realtime do
  100_000.times { symbol_AZ[:r] }
end

puts "String time: #{string_time} seconds."
puts "Symbol time: #{symbol_time} seconds."
```
```shell
String time: 0.007089582999469712 seconds.
Symbol time: 0.004449522995855659 seconds.
```

## More Methods, More Solutions
Great work!

We’ve often found we only want the key or value associated with a key/value pair, and it’s kind of a pain to put both into our block and only work with one. Can we iterate over just keys or just values?

This is Ruby. Of course we can.

Ruby includes two hash methods, .`each_key` and `.each_value`, that do exactly what you’d expect:
```ruby
my_hash = { one: 1, two: 2, three: 3 }

my_hash.each_key { |k| print k, " " }
# ==> one two three

my_hash.each_value { |v| print v, " " }
# ==> 1 2 3
```
Let’s wrap up our study of Ruby hashes and symbols by testing these methods out.
```ruby
movie_ratings = {
  memento: 3,
  primer: 3.5,
  the_matrix: 3,
  truman_show: 4,
  red_dawn: 1.5,
  skyfall: 4,
  alex_cross: 2,
  uhf: 1,
  lion_king: 3.5
}
# Add your code below!
movie_ratings.each_key { |k| puts k }
```