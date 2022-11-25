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
