# Overview & Sneak Peek
Ruby is a powerful, flexible programming language you can use in web/Internet development, to process text, to create games, and as part of the popular Ruby on Rails web framework. Ruby is:

- **High-level**, meaning reading and writing Ruby is really easy—it looks a lot like regular English!

- **Interpreted**, meaning you don’t need a compiler to write and run Ruby. You can write it here at Codecademy or even on your own computer (many are shipped with the Ruby interpreter built in—we’ll get to the interpreter later in this lesson).

- **Object-oriented**, meaning it allows users to manipulate data structures called objects in order to build and execute programs. We’ll learn more about objects later, but for now, all you need to know is everything in Ruby is an object.

- **Easy to use**. Ruby was designed by Yukihiro Matsumoto (often just called “Matz”) in 1995. Matz set out to design a language that emphasized human needs over those of the computer, which is why Ruby is so easy to pick up.

This course assumes no previous knowledge of Ruby in particular or programming/computer science in general.

## Data Types: Numbers, Strings, Booleans
In Ruby, your information (or data) can come in different types. There are three **data types** in Ruby that we’re interested in right now: **Numeric** (any number), **Boolean** (which can be true or false), and **String** (words or phrases like "I'm learning Ruby!").

Computer programs exist to quickly analyze and manipulate data. For that reason, it’s important for us to understand the different data types that we can use in our programs.

Reminder: never use quotation marks (‘ or “) with booleans, or Ruby will think you’re talking about a string (a word or phrase) instead of a value that can be true or false. It’s also important to remember that Ruby is case-sensitive (it cares about capitalization).

## Variables
One of the most basic concepts in computer programming is the **variable**. You can think of a variable as a word or name that grasps a single value. For example, let’s say you needed the number 25 from our last example, but you’re not going to use it right away. You can set a variable, say my_num, to grasp the value 25 and hang onto it for later use, like this:
```rb
my_num = 25
```
Declaring variables in Ruby is easy: you just write out a name like my_num, use = to assign it a value, and you’re done! If you need to change a variable, no sweat: just type it again and hit = to assign it a new value.

## Everything in Ruby is an Object
Because everything in Ruby is an object (more on this later), everything in Ruby has certain built-in abilities called **methods**. You can think of methods as “skills” that certain objects have. For instance, strings (words or phrases) have built-in methods that can tell you the length of the string, reverse the string, and more.

We also promised to tell you more about the **interpreter**. The interpreter is the program that takes the code you write and runs it. You type code in the editor, the interpreter reads your code, and it shows you the result of running your code in the **console**.

## Naming Conventions
There are many different kinds of variables you’ll encounter as you progress through these courses, but right now we’re just concerned with regular old **local variables**. By convention, these variables should start with a lowercase letter and words should be separated by underscores, like counter and masterful_method. Ruby won’t stop you from starting your local variables with other symbols, such as capital letters, $s, or @s, but by convention these mean different things, so it’s best to avoid confusion by doing what the Ruby community does.

## Strings and String Methods
Well done! Let’s do a little review of string methods. Remember, you call a method by using the . operator, like this: "string".method.