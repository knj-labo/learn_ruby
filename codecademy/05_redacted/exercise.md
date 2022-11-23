# What You'll Be Building
Hiding information is a major part of programming: protecting passwords, establishing secure connections, and securing programs against tampering all rely on controlling access to information.

While we won’t be able to really dig into information hiding until after we cover hashes in a later course, we can write a simple program to change a user’s input with the tools we have now: arrays and iterators.
```ruby
puts "Text to search through: "
text = gets.chomp
puts "Word to redact: "
redact = gets.chomp

words = text.split(" ")

words.each do |word|
  if word != redact
    print word + " "
  else
    print "REDACTED "
  end
end
```

## The .split Method
Next, we’ll want to divide the user’s input into individual words.

Ruby has a built-in method for this called `.split`; it takes in a string and returns an array. If we pass it a bit of text in parentheses, .split will divide the string wherever it sees that bit of text, called a delimiter. For example,
```ruby
text.split(",")
```
tells Ruby to split up the string text whenever it sees a comma.

## Control Flow Know-How
Good! There were two problems with our output, though: we didn’t have spaces between our words, and our program didn’t actually replace the word we wanted to redact with the word "REDACTED".

```ruby
if var == 10
  print "Variable is 10"
else
  print "Variable is something else"
end
```
We can fix that with some if/else magic! The above example just reminds you how an if/else block works.
