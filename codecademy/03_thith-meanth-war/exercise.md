## What You'll Be Building
Now that we can direct our program using if / else statements, we can produce different results based on different user input.

In this project, we’ll combine control flow with a few new Ruby string methods to Daffy Duckify a user’s string, replacing each "s" with "th".
```ruby
print "Thtring, pleathe!: "
user_input = gets.chomp
user_input.downcase!

if user_input.include? "s"
  user_input.gsub!(/s/, "th")
else
  puts "Nothing to do here!"
end
  
puts "Your string is: #{user_input}"
```

## Downcase!
We want to make sure we capture both "S" and "s" in the user’s input. We could write separate if / else statements to handle this, but we can also use .downcase! to convert the user’s input to all lower case. That way, we only have to search for "s".

## Setting Up the 'If' Branch, Part 1
All right! Time to add in a little control flow.

For the if half of our branch, we want to check whether the user’s input contains an "s".
```rb
if string_to_check.include? "substring"
```
We can do that using Ruby’s .include? method, which evaluates to true if it finds what it’s looking for and false otherwise.

(As a general rule, Ruby methods that end with ? evaluate to the boolean values true or false.)

## Setting Up the 'If' Branch, Part 2
Good! Now let’s complete our `if` statement.

When we find `"s"`, we want Ruby to replace every instance of `"s"` it finds with `"th"`. We can do this with the `.gsub!` method, which stands for **g**lobal **sub**stitution.

The syntax looks like this:
```ruby
string_to_change.gsub!(/s/, "th")
```
When we get to later lessons, we’ll explain why the /s/ has to be between slashes instead of between quotes. Note: you cannot put a space between gsub! and the bit in parentheses.

Remember, you want the ! at the end of the method name so that Ruby will change the string in-place.

## Returning the Final String—Er, "Thtring"
Home stretch—now we want to display the Daffy Duckified string to the user. You can do that using the string interpolation we learned earlier:
```ruby
my_string = "muchachos"
print "Adios, #{my_string}!"
# ==> "Adios, muchachos!"
```