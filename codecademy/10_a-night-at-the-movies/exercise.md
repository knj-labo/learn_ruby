# What You'll Be Building
Keeping track of all the parts of our digital lives is a pain. Now that you know how to write Ruby, however, you can make things easy for yourself! Let’s start by creating a program that will keep track of our movie ratings.

It’ll do one of four things: add a new movie to a hash, update the rating for an existing movie, display the movies and ratings that are already in the hash, or delete a movie from the hash. If it doesn’t receive one of those four commands, the program will output some kind of error message.

This project will give you a lot of room for creativity, but we know sometimes it can be a little disorienting to not have strict instructions. If you ever feel lost, don’t hesitate to check out the example code in this exercise to help you along
```ruby
movies = {
  Memento: 3,
  Primer: 4,
  Ishtar: 1
}

puts "What would you like to do?"
puts "-- Type 'add' to add a movie."
puts "-- Type 'update' to update a movie."
puts "-- Type 'display' to display all movies."
puts "-- Type 'delete' to delete a movie."

choice = gets.chomp.downcase
case choice
when 'add'
  puts "What movie do you want to add?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "What's the rating? (Type a number 0 to 4.)"
    rating = gets.chomp
    movies[title.to_sym] = rating.to_i
    puts "#{title} has been added with a rating of #{rating}."
  else
    puts "That movie already exists! Its rating is #{movies[title.to_sym]}."
  end
when 'update'
  puts "What movie do you want to update?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "Movie not found!"
  else
    puts "What's the new rating? (Type a number 0 to 4.)"
    rating = gets.chomp
    movies[title.to_sym] = rating.to_i
    puts "#{title} has been updated with new rating of #{rating}."
  end
when 'display'
  movies.each do |movie, rating|
    puts "#{movie}: #{rating}"
  end
when 'delete'
  puts "What movie do you want to delete?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "Movie not found!"
  else
    movies.delete(title.to_sym)
    puts "#{title} has been removed."
  end
else
  puts "Sorry, I didn't understand you."
end
```
## Setting Up
First things first: let’s create a hash to hold our movies and their ratings, and let’s prompt the user for input so we can eventually store movie/ratings pairs in our hash.
```ruby
favorite_foods = {
  'vegetable' => 'broccoli'
}
puts "Do you like coding in Ruby?"
answer = gets.chomp
```
A hash is a way of storing data by a specifiable key, as opposed to an array which can only sort using numbers. It is created like { } above.
puts asks a question on the command line, here we ask if you like coding in Ruby.
In order to get the user input, we have to call .chomp on gets

```ruby
movies = {
  Memento: 3,
  Primer: 4,
  Ishtar: 1
}

puts "What's the rating? (Type a number 0 to 4.)"
choice = gets.chomp
```
## The Case Statement
Good work! Now we’ll want to create the main body of our program: the case statement, which will decide what actions to take based on what the user types in.

if and else are powerful, but we can get bogged down in ifs and elsifs if we have a lot of conditions to check. Thankfully, Ruby provides us with a concise alternative: the case statement. The syntax looks like this:
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
The else is what the case statement will do if it doesn’t match any of its when statements to the case (in this case, the value of language).

## Prompting: Redux!
Great! Let’s build out each part of the case, one step at a time. We’ll start with the “add” branch.
```ruby
movies = {
  StarWars: 4.8, 
  Divergent: 4.7
  }

puts "What would you like to do? "

choice = gets.chomp

case choice
when "add"
  puts "What movie would you like to add? "
  title = gets.chomp
  puts "What rating does the movie have? "
  rating = gets.chomp
  movies[title.to_s] = rating
when "update"
  puts "Updated!"
when "display"
  puts "Movies!"
when "delete"
  puts "Deleted!"
else
  puts "Error!"
end
```