## Try it yourself!
```rb
def double(num)
  yield(num)
end

double(16) {|x| puts x * 2}
```

## Keeping Your Code DRY
Remember when we told you that everything is an object in Ruby? Well, we sort of fibbed. Blocks are not objects, and this is one of the very few exceptions to the “everything is an object” rule in Ruby.

Because of this, blocks can’t be saved to variables and don’t have all the powers and abilities of a real object. For that, we’ll need… procs!

You can think of a proc as a “saved” block: just like you can give a bit of code a name and turn it into a method, you can name a block and turn it into a proc. Procs are great for keeping your code DRY, which stands for Don’t Repeat Yourself. With blocks, you have to write your code out each time you need it; with a proc, you write your code once and can use it many times!
```ruby
multiples_of_3 = Proc.new do |n|
  n % 3 == 0
end

print (1..100).to_a.select(&multiples_of_3)
```
## Proc Syntax
Procs are easy to define! You just call `Proc.new` and pass in the block you want to save. 
Here’s how we’d create a proc called cube that cubes a number (raises it to the third power):
```ruby
cube = Proc.new { |x| x ** 3 }
```
We can then pass the proc to a method that would otherwise take a block, and we don’t have to rewrite the block over and over!
```ruby
[1, 2, 3].collect!(&cube)
# ==> [1, 8, 27]
[4, 5, 6].map!(&cube)
# ==> [64, 125, 216]
```
(The `.collect!` and `.map!` methods do the exact same thing.)

The `&` is used to convert the `cube` proc into a block (since `.collect!` and `.map!` normally take a block). We’ll do this any time we pass a proc to a method that expects a block.
```ruby
floats = [1.2, 3.45, 0.91, 7.727, 11.42, 482.911]
# Write your code below this line!

round_down = Proc.new { |x| x.floor }

# Write your code above this line!
ints = floats.collect(&round_down)
print ints
```

## Why Procs?
Why bother saving our blocks as procs? There are two main advantages:
1. Procs are full-fledged objects, so they have all the powers and abilities of objects. (Blocks do not.)
2. Unlike blocks, procs can be called over and over without rewriting them. This prevents you from having to retype the contents of your block every time you need to execute a particular bit of code.
```ruby
# Here at the amusement park, you have to be four feet tall
# or taller to ride the roller coaster. Let's use .select on
# each group to get only the ones four feet tall or taller.

group_1 = [4.1, 5.5, 3.2, 3.3, 6.1, 3.9, 4.7]
group_2 = [7.0, 3.8, 6.2, 6.1, 4.4, 4.9, 3.0]
group_3 = [5.5, 5.1, 3.9, 4.3, 4.9, 3.2, 3.2]

# Complete this as a new Proc
over_4_feet = Proc.new { |height| height >= 4 }

# Change these three so that they use your new over_4_feet Proc
can_ride_1 = group_1.select(&over_4_feet)
can_ride_2 = group_2.select(&over_4_feet)
can_ride_3 = group_3.select(&over_4_feet)

puts can_ride_1
puts can_ride_2
puts can_ride_3 
```
## Create Your Own! 
Okay! Time to take off the training wheels.
```ruby
cube = Proc.new { |x| x ** 3 }
[1, 2, 3].map(&cube)
# [1, 8, 27]
```
You’re going to create your very own method that calls your very own proc! We’ll do this in two steps. Use the example above as a syntax reminder.
```ruby
def greeter
  yield
end

phrase = Proc.new { puts "Hello there!" }

greeter(&phrase)
```

## Call Me Maybe
Nice work! Calling a proc with a method isn’t too tricky. However, there’s an even easier way.

Unlike blocks, we can call procs directly by using Ruby’s `.call` method. Check it out!
```ruby
test = Proc.new { # does something }
test.call
# does that something!
```
Remember: there’s always more than one way to do something in Ruby.
```ruby
hi = Proc.new { puts "Hello!" }
hi.call
```
## Symbols, Meet Procs
Now that you’re learning some of the more complex parts of the Ruby language, you can combine them to work some truly arcane magicks. For instance, remember when we told you that you could pass a Ruby method name around with a symbol? Well, you can also convert symbols to procs using that handy little &.

Check it out:
```ruby
strings = ["1", "2", "3"]
nums = strings.map(&:to_i)
# ==> [1, 2, 3]
```
By mapping &:to_i over every element of strings, we turned each string into an integer!
```ruby
numbers_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

strings_array = numbers_array.map(&:to_s)
```

The Ruby Lambda
Like procs, lambdas are objects. The similarities don’t stop there: with the exception of a bit of syntax and a few behavioral quirks, lambdas are identical to procs.

Check out the code in the editor. See the lambda bit? Typing

```ruby
lambda { puts "Hello!" }
Is just about the same as
```
```ruby
Proc.new { puts "Hello!" }
```
In the example to the right, when we pass the lambda to lambda_demo, the method calls the lambda and executes its code.

```ruby
def lambda_demo(a_lambda)
  puts "I'm the method!"
  a_lambda.call
end

lambda_demo(lambda { puts "I'm the lambda!" })
```

## Lambda Syntax
Lambdas are defined using the following syntax:
```ruby
lambda { |param| block }
```
Lambdas are useful in the same situations in which you’d use a proc. We’ll cover the differences between lambdas and procs in the next exercise; in the meantime, let’s get a little practice in with the lambda syntax.
```ruby
strings = ["leonardo", "donatello", "raphael", "michaelangelo"]
# Write your code below this line!

symbolize = lambda {|x| x.to_sym}

# Write your code above this line!
symbols = strings.collect(&symbolize)
print symbols
```

## Now You Try!
Great work! You’ve written your own lambda and seen how to pass it to a method. Now it’s time for you to write a lambda and pass it to a method!

If you think this will be a lot like what you’ve already done with procs, you’re exactly right. Just like with procs, we’ll need to put & at the beginning of our lambda name when we pass it to the method, since this will convert the lambda into the block the method expects.

That symbolize lambda was pretty cool. Let’s riff on it with a lambda that checks to see if each element in an array is a symbol. We can do this checking with the .is_a? method, which returns true if an object is the type of object named and false otherwise:
```ruby
:hello.is_a? Symbol
# ==> true
```

```ruby
my_array = ["raindrops", :kettles, "whiskers", :mittens, :packages]

# Add your code below!
symbol_filter = lambda {|x| x.is_a? Symbol}
symbols = my_array.select(&symbol_filter)

my_array = ["raindrops", :kettles, "whiskers", :mittens, :packages]

puts symbols
```
## Quick Review
All this talk of blocks, procs, and lambdas might have your head spinning. Let’s take a minute to clarify exactly what each one is:

1. A block is just a bit of code between do..end or {}. It’s not an object on its own, but it can be passed to methods like .each or .select. 
2. A proc is a saved block we can use over and over. 
3. A lambda is just like a proc, only it cares about the number of arguments it gets and it returns to its calling method rather than returning immediately.
There are obviously lots of cases in which blocks, procs, and lambdas can do similar work, but the exact circumstances of your program will help you decide which one you want to use.

## Been Around the Block a Few Times
You’re basically a Ruby block master at this point. This should be pretty easy!
```ruby
odds_n_ends = [:weezard, 42, "Trady Blix", 3, true, 19, 12.345]

ints = odds_n_ends.select{|x| x.is_a? Integer }

puts ints
```

## Passing Your Proc to a Method
```ruby
ages = [23, 101, 7, 104, 11, 94, 100, 121, 101, 70, 44]

# Add your code below!
under_100 = Proc.new { |x| x < 100 }
youngsters = ages.select(&under_100)
```

## Creating a Lambda
Second verse: same as the first! Let’s go ahead and make ourselves a lambda.
```ruby
crew = {
captain: "Picard",
first_officer: "Riker",
lt_cdr: "Data",
lt: "Worf",
ensign: "Ro",
counselor: "Troi",
chief_engineer: "LaForge",
doctor: "Crusher"
}
# Add your code below!
first_half = lambda { |x,y| y<"M"}
```
## Passing your Lambda to a Method
```ruby
crew = {
  captain: "Picard",
  first_officer: "Riker",
  lt_cdr: "Data",
  lt: "Worf",
  ensign: "Ro",
  counselor: "Troi",
  chief_engineer: "LaForge",
  doctor: "Crusher"
}
# Add your code below!
first_half = lambda { |x,y| y<"M"}

a_to_m = crew.select(&first_half)
```



