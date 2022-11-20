# How It Works
You may have noticed that the kinds of programs we’ve written so far in Ruby aren’t very flexible. Sure, they can take user input, but they always produce the same result based on that input; they don’t change their behavior in reaction to the **environment** (the collection of all variables and their values that exist in the program at a given time).

**Control flow** gives us the flexibility we’re looking for. We can select different outcomes depending on information the user types, the result of a computation, or the value returned by another part of the program.
```rb
print "Integer please: "
user_num = Integer(gets.chomp)

if user_num < 0
  puts "You picked a negative integer!"
elsif user_num > 0
  puts "You picked a positive integer!"
else
  puts "You picked zero!"
end
```

## If
Ruby’s if statement takes an **expression**, which is just a fancy word for something that has a value that evaluates to either true or false. If that expression is true, Ruby executes the block of code that follows the if. If it’s not true (that is, false), Ruby doesn’t execute that block of code: it skips it and goes on to the next thing.

Here’s an example of an if statement in action:
```ruby
if 1 < 2
    print "I'm getting printed because one is less than two!"
end
```
Ruby doesn’t care about **whitespace** (spaces and blank lines), so the indentation of the print statement isn’t necessary. However, it’s a convention that Rubyists (Ruby enthusiasts) follow, so it’s good to get in the habit now. The block of code following an if should be indented two spaces.

When you’re done with your if, you have to tell Ruby by typing end.

## Else
The partner to the if statement is the else statement. An if/else statement says to Ruby: “If this expression is true, run this code block; otherwise, run the code after the else statement.” Here’s an example:
```rb
if 1 > 2
  print "I won't get printed because one is less than two."
else
  print "That means I'll get printed!"
end
```

## Elsif
What if you want more than two options, though? It’s elsif to the rescue! The elsif statement can add any number of alternatives to an if/else statement, like so:
```ruby
if x < y  # Assumes x and y are defined
  puts "x is less than y!"
elsif x > y
  puts "x is greater than y!"
else
  puts "x equals y!"
end
```

## Unless
Sometimes you want to use control flow to check if something is false, rather than if it’s true. You could reverse your if/else, but Ruby will do you one better: it will let you use an unless statement.

Let’s say you don’t want to eat unless you’re hungry. That is, while you’re not hungry, you write programs, but if you are hungry, you eat. You might write that program in Ruby like this:
```ruby
unless hungry
  # Write some sweet programs
else
  # Have some noms
end
```

## Equal or Not?
In Ruby, we assign values to variables using =, the **assignment operator**. But if we’ve already used `=` for assignment, how do we check to see if two things are equal? Well, we use ==, which is a **comparator** (also called a **relational operator**). == means “is equal to.” When you type
```ruby
x = 2
y = 2
if x == y
  print "x and y are equal!"
end
```
you’re saying: “if x equals y, print ‘x and y are equal!’” You can also check to see if two values are not equal using the != comparator.

## Less Than or Greater Than
We can also check to see if one value is less than, less than or equal to, greater than, or greater than or equal to another. Those operators look like this:

- Less than: <
- Less than or equal to: <= 
- Greater than: >
- Greater than or equal to: >=

## And
Comparators aren’t the only operators available to you in Ruby. You can also use **logical** or **boolean operators**. Ruby has three: **and** (`&&`), or (`||`), and not (`!`). Boolean operators result in boolean values: `true` or `false`.

The boolean operator **and**, `&&`, only results in `true` when **both** expression on either side of `&&` are `true`. 
Here’s how && works:
```ruby
true && true # => true
true && false # => false
false && true # => false
false && false # => false
```
For example, 1 < 2 && 2 < 3 is true because it’s true that one is less than two and that two is less than three.

## Or
Ruby also has the or operator (||). Ruby’s || is called an **inclusive or** because it evaluates to true when one or the other or both expressions are true. Check it out:
```ruby
true || true # => true
true || false # => true
false || true # => true
false || false # => false
```

## Not
Finally, Ruby has the boolean operator **not** (!). ! makes true values false, and vice-versa.

## Combining Boolean Operators
You can combine boolean operators in your expressions. Combinations like
```ruby
(x && (y || w)) && z
```
are not only legal expressions, but are extremely useful tools for your programs.

These expressions may take some getting used to, but you can always use parentheses to control the order of evaluation. Expressions in parentheses are always evaluated before anything outside parentheses.