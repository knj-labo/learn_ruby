# What You'll Be Building
This project will help you create a small program that will read a user’s input and correct his or her capitalization. Users can provide an almost infinite range of input, so it makes our lives easier as programmers to make their input standard before doing anything with it.

## Prompting the User
First, let’s write the code we’re already familiar with. In order to get input from the user, we’ll first need to print a prompt on the screen.

## Getting Input
Good! Now let’s try something new. You may have noticed this weird little line of code repeated in our example:
```rb
variable_name = gets.chomp
```
gets is the Ruby method that gets input from the user. When getting input, Ruby automatically adds a blank line (or newline) after each bit of input; chomp removes that extra line. (Your program will work fine without chomp, but you’ll get extra blank lines everywhere.)

## Printing the Output
As you may have noticed, Ruby’s not returning any feedback to us. We want to be able to see our string formatting in action! For this, we’ll need one more new piece of syntax.

If you define a variable `monkey` that’s equal to the string `"Curious George"`, and then a string that says `"I took #{monkey} to the zoo"`, Ruby will do something called string interpolation and replace the `#{monkey}` bit with the value of monkey. Therefore, it will print `"I took Curious George to the zoo"`.

We can do the same thing here. For example:
```rb
first_name = "Kevin"
puts "Your name is #{first_name}!"
```
The code above will print `Your name is Kevin!.`

## Formatting with String Methods
Great! Now we’ve got our output, but as you can see, we haven’t used string methods to properly capitalize everything yet.
```rb
print "This is my question?"
answer = gets.chomp
answer2 = answer.capitalize
answer.capitalize!
```
1. First we introduce one new method, capitalize, here. It capitalizes the first letter of a string and makes the rest of the letters lower case. We assign the result to answer2
2. The next line might look a little strange, we don’t assign the result of capitalize to a variable. Instead you might notice the ! at the end of capitalize. This modifies the value contained within the variable answer itself. The next time you use the variable answer you will get the results of answer.capitalize