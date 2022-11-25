# Method Syntax
Methods are defined using the keyword def (short for “define”). Methods have three parts:

1. The header, which includes the def keyword, the name of the method, and any arguments the method takes. (We’ll get to arguments in the next section)
2. The body, which is the code block that describes the procedures the method carries out. The body is indented two spaces by convention (as with for, if, elsif, and else statements)
3. The method ends with the end keyword.
Here’s an example of what the syntax would look like for a simple function, welcome, that just prints “Welcome to Ruby!” to the console:

```ruby
def welcome
  puts "Welcome to Ruby!"
end
```

## Create Your Own
Now it’s time for you to build your own method. Remember, the syntax looks like this:
```ruby
def method_name
  # Do something!
end
```

```ruby
# Define your method below!
def greeting
 puts "greeting"
end

# Define your method above this line.
greeting # Ignore this for now. We'll explain
         # it in the next exercise!
```

## Call It!
Defining a method is great, but it’s not much use to you unless you call it, or tell your program to execute it. For example, if you call a method called cartoon_fox, the program will start looking for the method with that name and try to execute the code inside it.

If the program doesn’t find a method called cartoon_fox, it will return a NameError. We’ll cover errors in another lesson.

You call a method just by typing its name. Remember when you saw us type puts_1_to_10 or greeting after our method definition in the last two exercises? That was us calling our methods!
```ruby
def array_of_10
  puts (1..10).to_a
end

array_of_10
```

## Parameters and Arguments
If a method takes arguments, we say it accepts or expects those arguments. We might define a function, square, like so:

```ruby
def square(n)
  puts n ** 2
end
```
and call it like this:
```ruby
square(12)
# ==> prints "144"
```
The argument is the piece of code you actually put between the method’s parentheses when you call it, and the parameter is the name you put between the method’s parentheses when you define it. For instance, when we defined square above, we gave it the parameter n (for “number”) and passed it the argument 12 when we called it.

You can think of parameters as placeholders the method definition gives to arguments since it doesn’t know ahead of time exactly what argument it’s going to get.

Parentheses are usually optional in Ruby, but it’s a good idea to put your parameters and arguments in parentheses for readability.

```ruby
def cubertino(n)
  puts n ** 3
end

cubertino(8)
```

## Splat!
Speaking of not knowing what to expect: your methods not only don’t know what arguments they’re going to get ahead of time but occasionally, they don’t even know how many arguments there will be.

Let’s say you have a method, friend, that puts the argument it receives from the user. It might look something like this:
```ruby
def friend(name):
  puts "My friend is " + name + "."
end
```
This is great for just one friend, but what if you want to print out the all of the user’s friends, without knowing how many friend names the user will put in ahead of time?

The solution: splat arguments. Splat arguments are arguments preceded by a *, which tells the program that the method can receive one or more arguments.
```ruby
def what_up(greeting, *friends)
  friends.each { |friend| puts "#{greeting}, #{friend}!" }
end

what_up("What up", "Ian", "Zoe", "Zenas", "Eleanor")
```

## Let's Learn Return
Sometimes we don’t just want a method to print something to the console, but we actually want that method to hand us (or another method!) back a value. For that, we use return.

```ruby
def double(n)
return n * 2
end

output = double(6)
output += 2
puts output
```
1. In the example above, we define a new method called double that accepts one parameter called n. 
2. Inside the method, we return two times n. 
3. After that, we call our new double method with an argument of 6 and store the result, 12, in output. 
4. Then, we increase output to 14 and print it out to the console.

## Practice Makes Perfect
You won’t become a Master Method Maker ‘til you make a mess of methods. (Say that three times fast.)
```ruby
def by_five?(n)
  return n % 5 == 0
end
```
The example above is just a reminder on how to define a method.

## Blocks Are Like Nameless Methods
Most methods that you’ve worked with have defined names that either you or someone else gave them (i.e. [array].sort(), “string”.downcase(), and so on). You can think of blocks as a way of creating methods that don’t have a name. (These are similar to anonymous functions in JavaScript or lambdas in Python.)

Blocks can be defined with either the keywords do and `end` or with curly braces (`{}`).
```ruby
1.times do
  puts "I'm a code block!"
end

1.times { puts "As am I!" }
```

## How Blocks Differ from Methods
There are some differences between blocks and methods, however.

Check out the code in the editor. The `capitalize` method capitalizes a word, and we can continually invoke the `capitalize` method by name. We can `capitalize("matz")`, `capitalize("eduardo")`, or any string we like to our hearts’ content.

However, the block that we define (following `.each`) will only be called once, and in the context of the array that we are iterating over. It appears just long enough to do some work `for each`, then vanishes into the night.
```ruby
# method that capitalizes a word
def capitalize(string) 
  puts "#{string[0].upcase}#{string[1..-1]}"
end

capitalize("ryan") # prints "Ryan"
capitalize("jane") # prints "Jane"

# block that capitalizes each string in the array
["ryan", "jane"].each {|string| puts "#{string[0].upcase}#{string[1..-1]}"} # prints "Ryan", then "Jane"
```

## Using Code Blocks
A method can take a block as a parameter. That’s what `.each` has been doing this whole time: taking a block as a parameter and doing stuff with it! You just didn’t notice because we didn’t use the optional parentheses. We are sneaky.

Passing a block to a method is a great way of abstracting certain tasks from the method and defining those tasks when we call the method. Abstraction is an important idea in computer science, and you can think of it as meaning “making something simpler.” Imagine if when you wanted to house hunt, you had to say, “Honey, let’s go look at configurations of concrete, plywood, and vinyl siding.” That’d be crazy! Just like saying “house” simplifies listing its components, using a block to define the task you want the method (like `.each`) to do simplifies the task at hand.
```ruby
# The block, {|i| puts i}, is passed the current
# array item each time it is evaluated. This block
# prints the item. 
[1, 2, 3, 4, 5].each { |i| puts i }

# This block prints the number 5 for each item.
# (It chooses to ignore the passed item, which is allowed.)
[1, 2, 3, 4, 5].each { |i| puts i * 5 }
```

## Basic Methods
Let’s quickly review how to create a basic Ruby method.
```ruby
def double(n)
  return n * 2
end
```
The example above is just a syntax reminder.