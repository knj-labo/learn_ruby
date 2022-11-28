# Ruby is a Delight
As a language, Ruby prioritizes programmer productivity over program optimization. This means that Ruby may not always run a program in the fastest way possible, but it strives to be a language that programmers (like you!) find easy and fun to use. The more intuitive a language’s syntax is, the more productive its users can be. You’re in control, not the machine!

Check out the code in the editor. It looks almost like English, doesn’t it?
```ruby
ruby_is_eloquent = true
ruby_is_ugly = false

puts "Ruby is eloquent!" if ruby_is_eloquent
puts "Ruby's not ugly!" unless ruby_is_ugly
```
## A Simpler 'If'
You’ve seen the Ruby if statement before:
```ruby
if condition
 # Do something!
end
```
If the “do something” is a short, simple expression, however, we can move it up into a single line (as you saw in the last exercise). The syntax looks like this:
```ruby
expression if boolean
```
Ruby will expect an expression followed by if followed by a boolean. The order is important. You can do this:
```ruby
puts "It's true!" if true
```
but not this:
```ruby
if true puts "It's true!"
```
It’s also important to note that you don’t need an end when you write your if statement all on one line.

## The One-Line Unless
You can do the exact same thing with the unless statement. The order is the same as before: something for Ruby to do, the unless keyword, and then an expression that evaluates to true or false.

Remember, you don’t need an end when you write a one-line if or unless!
```ruby
puts "its false!" unless false
```

## One Good Turn Deserves a Ternary
During your Ruby adventures, you’ve seen that you often have many options when it comes to accomplishing any one goal. The if statement is no exception!

An even more concise version of if/else is the ternary conditional expression. It’s called “ternary” because it takes three arguments: a boolean, an expression to evaluate if the boolean is true, and an expression to evaluate if the boolean is false.

The syntax looks like this:
```ruby
boolean ? Do this if true: Do this if false
```
An example might be
```ruby
puts 3 < 4 ? "3 is less than 4!" : "3 is not less than 4."
```
Remember: the order of arguments is important, and you don’t need an end for this version of `if/else`.

## When and Then: The Case Statement
The if/else statement is powerful, but we can get bogged down in ifs and elsifs if we have a lot of conditions to check. Thankfully, Ruby provides us with a concise alternative: the case statement. The syntax looks like this:
```ruby
case language
  when "JS"
    puts "Websites!"
  when "Python"
    puts "Science!"
  when "Ruby"
    puts "Web apps!"
  else
    puts "I don't know!"
end
```
## Conditional Assignment
We’ve seen that we can use the = operator to assign a value to a variable. But what if we only want to assign a variable if it hasn’t already been assigned?

For this, we can use the conditional assignment operator: ||=. It’s made up of the or (||) logical operator and the normal = assignment operator.
```ruby
favorite_book = nil
puts favorite_book

favorite_book ||= "Cat's Cradle"
puts favorite_book

favorite_book ||= "Why's (Poignant) Guide to Ruby"
puts favorite_book

favorite_book = "Why's (Poignant) Guide to Ruby"
puts favorite_book
```

## Implicit Return
We know that methods in Ruby can return values, and we ask a method to return a value when we want to use it in another part of our program. What if we don’t put a return statement in our method definition, though?

For instance, if you don’t tell a JavaScript function exactly what to return, it’ll return undefined. For Python, the default return value is None. But for Ruby, it’s something different: Ruby’s methods will return the result of the last evaluated expression.

This means that if you have a Ruby method like this one:
```ruby
def add(a,b)
  return a + b
end
```
You can simply write:
```ruby
def add(a,b)
  a + b
end
```
And either way, when you call add(1,1), you’ll get 2.

## Short-Circuit Evaluation
Recall that we have the boolean operators and (&&) and or (||) in Ruby. The && operator only returns true when the expressions on both sides of the operator are true; || returns true when one or the other or both of the expressions involved are true.

Ruby does this via short-circuit evaluation. That means that Ruby doesn’t look at both expressions unless it has to; if it sees
```ruby
false && true
```
it stops reading as soon as it sees && because it knows false && anything must be false.

Remember how Ruby returns the result of the last expression it evaluated? We can use that to show short-circuit evaluation in action.
```ruby
def a
  puts "A was evaluated!"
  return true
end

def b
  puts "B was also evaluated!"
  return true
end

puts a || b
puts "------"
puts a && b
```

## The Right Tool for the Job
Sooner or later, you’re going to need to perform a repetitive task in your programs. Many programming languages allow you to do this with a for loop, and while Ruby does include for loops, there are better tools available to us.

If we want to do something a specific number of times, we can use the .times method, like so:
```ruby
5.times { puts "Odelay!" }
# Prints 5 "Odelay!"s on separate lines
```
If we want to repeat an action for every element in a collection, we can use .each:
```ruby
[1, 2, 3].each { |x| puts x * 10 }
# Prints 10, 20, 30 on separate lines
```

## Up the Down Staircase
If we know the range of numbers we’d like to include, we can use .upto and .downto. This is a much more Rubyist solution than trying to use a for loop that stops when a counter variable hits a certain value.

We might use .upto to print out a specific range of values:
```ruby
95.upto(100) { |num| print num, " " }
# Prints 95 96 97 98 99 100
```
and we can use .downto to do the same thing with descending values.

Do you think .upto and .downto work on the alphabet? Only one way to find out!

## Call and Response
Remember when we mentioned that symbols are awesome for referencing method names? Well, .respond_to? takes a symbol and returns true if an object can receive that method and false otherwise. For example,
```ruby
[1, 2, 3].respond_to?(:push)
would return true, since you can call .push on an array object. However,
```
```ruby
[1, 2, 3].respond_to?(:to_sym)
would return false, since you can’t turn an array into a symbol.
```
```ruby
age = 26

# Add your code below!
age.respond_to?(:next)
```

## Being Pushy
Speaking of pushing to arrays, Ruby has some nice shortcuts for common method names. As luck would have it, one is for .push!

Instead of typing out the .push method name, you can simply use <<, the concatenation operator (also known as “the shovel”) to add an element to the end of an array:
```ruby
[1, 2, 3] << 4
# ==> [1, 2, 3, 4]
```
Good news: it also works on strings! You can do:
```ruby
"Yukihiro " << "Matsumoto"
# ==> "Yukihiro Matsumoto"
```

```ruby
alphabet = ["a", "b", "c"]
alphabet << "d" # Update me!

caption = "A giraffe surrounded by "
caption << "weezards!" # Me, too!
```

## String Interpolation
You can always use plain old + or << to add a variable value into a string:
```ruby
drink = "espresso"
"I love " + drink
# ==> I love espresso
"I love " << drink
# ==> I love espresso
```
But if you want to do it for non-string values, you have to use .to_s to make it a string:
```ruby
age = 26
"I am " + age.to_s + " years old."
# ==> "I am 26 years old."
"I am " << age.to_s << " years old."
# ==> "I am 26 years old."
```
This is complicated, and complicated is not the Ruby way. A better way to do this is with string interpolation. The syntax looks like this:
```ruby
"I love #{drink}."
# ==> I love espresso.
"I am #{age} years old."
# ==> I am 26 years old.
```
All you need to do is place the variable name inside #{} within a string!

## One-Liners
All right! Time to put your new knowledge to work by refactoring some existing code. Refactoring is just a fancy way of saying we’re improving the structure or appearance of our code without changing what it actually does.

We won’t cover every bit of syntax from the previous exercises, but we’ll hit the highlights. Ready?
```ruby
puts "One is less than two!" if 1 < 2
```

## The Ternary Operator
Good! Let’s make our code even more streamlined using the ternary operator.
```ruby
three = 3
puts three == 3 ? "Of course." : "What?"
# ==> puts "Of course."
```
The example above is just a syntax reminder.
```ruby
puts 1 < 2 ? "One is less than two!":"One is not less than two."
```
## In Case of Many Options
Excellent. Regular if/else statements aren’t the only ones we can refactor, though—a chain of if/elsif/else statements can clean up really nicely, too!

## Conditional Assignment
Perfect! Now let’s review conditional assignment. We’ll take a break from strict editing mode and let you do a bit more writing

## Implicit Return
Next up: let’s simplify our method madness by removing unnecessary returns from our code.
```ruby
def square(n)
  n ** 2
end
```