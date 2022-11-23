# Creating Arrays
Earlier we saw that an array can be used to store a list of values in a single variable. You can stuff any number of numbers in there, you can repeat numbers, and they don’t have to be in numeric order!

## Access by Index
Here’s something interesting about arrays: each element in the array has what’s called an index. The first element is at index 0, the next is at index 1, the following is at index 2, and so on. We can access elements of the array directly through these numbers using brackets, like so:

```ruby
array = [5, 7, 9, 2, 0]
array[2]
# returns "9", since "9"
# is at index 2
```

The diagram below shows how these indices work for our sample array, `[5, 7, 9, 2, 0]`. The first element has index 0, the next has 1, the next has 2, and so on.
```shell
        +---+---+---+---+---+
array   | 5 | 7 | 9 | 2 | 0 |
        +---+---+---+---+---+
index     0   1   2   3   4
```
(This is a bit of an oversimplification, but it gets the idea across for now).

We can access the ith element of an array called array by putting the index in square brackets, like so: `array[i]`. `array[0]` gets the first element, `array[1]` gets the second element, and so on. This is called access by index.

## Arrays of Non-Numbers
Here’s something you might not have known: you can make an array of any collection of Ruby objects. You can make an array of booleans! An array of strings! The possibilities are (almost) endless.

## Arrays of Arrays
You might be asking yourself: “If I can put anything in an array, can I make an array of arrays?” The answer is: yes!

Check out the array of arrays we have in the editor. Arrays of arrays are called multidimensional arrays, since the act of adding more arrays expands the array out of its string-like shape. For instance, the array in the editor is a two-dimensional array.
```ruby
multi_d_array = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]

multi_d_array.each { |x| puts "#{x}\n" }
```

## Create Your Own
See how a two-dimensional array with the same number of elements per row and overall rows is a square? An array (like a line) is one-dimensional; an array of arrays (like a square) is two-dimensional.
```ruby
my_2d_array = [[1,2,3],["1", "2", "3"]]
```

## Introduction to Hashes
We know that arrays are indexed with numbers that start with 0 and go up to the array’s length minus one. (Think about it: an array with four elements has the indices 0, 1, 2, and 3.)

But what if we want to use numeric indices that don’t go in order from 0 to the end of the array? What if we don’t want to use numbers as indices at all? We’ll need a new array structure called a hash.

Hashes are sort of like JavaScript objects or Python dictionaries. If you haven’t studied those languages, all you need to know that a hash is a collection of key-value pairs. Hash syntax looks like this:

```ruby
hash = {
 key1 => value1,
 key2 => value2,
 key3 => value3
}
```
Values are assigned to keys using =>. You can use any Ruby object for a key or value.

## Using Hash.new
What we just showed you was hash literal notation. We call it that because you literally describe what you want in the hash: you give it a name and you set it equal to one or more `key => value` pairs inside curly braces.

You can also create a hash using Hash.new, like so:
```ruby
my_hash = Hash.new
```
Setting a variable equal to `Hash.new` creates a new, empty hash; it’s the same as setting the variable equal to empty curly braces (`{}`).

## Adding to a Hash
We can add to a hash two ways: if we created it using literal notation, we can simply add a new key-value pair directly between the curly braces. If we used `Hash.new`, we can add to the hash using bracket notation:
```ruby
pets = Hash.new
pets["Stevie"] = "cat"
# Adds the key "Stevie" with the
# value "cat" to the hash
```

## Accessing Hash Values
You can access values in a hash just like an array.
```ruby
pets = {
 "Stevie" => "cat",
 "Bowser" => "hamster",
 "Kevin Sorbo" => "fish"
}

puts pets["Stevie"]
# will print "cat"
```
1. In the example above, we create a hash called `pets`. 
2. Then we print cat by accessing the key `"Stevie"` in the pets hash.

## (Re)Introduction to Iteration
We could use a whole bunch of different methods for looping in a program. When we loop over an array or a hash, we say that we iterate over it.

We’ll be using the `.each` iterator to iterate over arrays and hashes in this section. Take a look at the code in the editor to see one example of how we might go about this
```ruby
friends = ["Milhouse", "Ralph", "Nelson", "Otto"]

family = { "Homer" => "dad",
  "Marge" => "mom",
  "Lisa" => "sister",
  "Maggie" => "sister",
  "Abe" => "grandpa",
  "Santa's Little Helper" => "dog"
}

friends.each { |x| puts "#{x}" }
family.each { |x, y| puts "#{x}: #{y}" }
```

## Iterating Over Arrays
Iterating over arrays is easier than it looks.
```ruby
numbers = [1, 2, 3, 4, 5]
numbers.each { |element| puts element }
```
1. In the example above, we create an array called numbers with 5 elements. 
2. Then we say, “Take this array and for each element, print it to the console.” As usual, we can use any placeholder name for the bit between two | | characters.

## Iterating Over Multidimensional Arrays
Now let’s see how to iterate over a multidimensional array.

We’ve created a 2-D array, `s` (for “sandwiches”). We want to iterate over `s` in such a way that we don’t print out each element as an array, like `["ham", "swiss"]`, but each element within each sub-array, so we get a list of all the meats and cheeses within `s`.

If we just wanted to access "swiss", we could type
```ruby
s[0][1]
```
Meaning, “bring me the second element of the first element,” which is “swiss.” If we iterate over a regular array using
```ruby
array.each { |element| action }
```
then how might we iterate over an array of arrays?

```ruby
s = [["ham", "swiss"], ["turkey", "cheddar"], ["roast beef", "gruyere"]]

s.each { |sub_array| sub_array.each { |array| puts array }}
```

## Iterating Over Hashes
When iterating over hashes, we need two placeholder variables to represent each key/value pair.
```ruby
restaurant_menu = {
 "noodles" => 4,
 "soup" => 3,
 "salad" => 2
}
```
```ruby
restaurant_menu.each do |item, price|
  puts "#{item}: #{price}"
end
```
1. In the example above, we create a new hash called restaurant_menu. 
2. Then, we loop through the restaurant_menu hash and assign the key to item and the value to price for each iteration. 
3. Finally, we puts out:
```ruby
noodles: 4
soup: 3
salad: 2
```

## Multidimensional Arrays
Great work! You’ve learned a lot in this lesson. Let’s do a little review to be sure you really know your stuff.