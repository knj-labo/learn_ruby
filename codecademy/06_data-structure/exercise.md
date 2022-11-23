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

