## Why Classes?
Ruby is an object-oriented programming language, which means it manipulates programming constructs called objects. (Almost) everything in Ruby is an object! You’ve been using them all along, so they should be very familiar. Objects have methods, which you’ve seen before, and attributes, which are just data. For instance, in
```ruby
"Matz".length
# ==> 4
```
the `"Matz"` object is a string with a `.length` method and a length attribute of 4. We’ll learn how to build our own objects with their own methods and internal variables in the next few exercises.

But what exactly makes `"Matz"` a string? The fact that it’s an instance of the `String` class. A class is just a way of organizing and producing objects with similar attributes and methods.
```ruby
class Language
  def initialize(name, creator)
    @name = name
    @creator = creator
  end
	
  def description
    puts "I'm #{@name} and I was created by #{@creator}!"
  end
end

ruby = Language.new("Ruby", "Yukihiro Matsumoto")
python = Language.new("Python", "Guido van Rossum")
javascript = Language.new("JavaScript", "Brendan Eich")

ruby.description
python.description
javascript.description
```

## Class Syntax
A basic class consists only of the `class` keyword and the name of the class. Check it out:
```ruby
class NewClass
  # Class magic here
end
```
Our `NewClass` has the ability to create new Ruby objects of class `NewClass` (just like `"Hello!"` is a `String` and 4 is a `Fixnum`). By convention, class names start with a capital letter and use CamelCase instead of relying_on_underscores.

## Classing It Up
We’d like our classes to do more than… well, nothing, so we’ll have to add some code between our `class Person` and `end`.

You may have noticed in our example back in the first exercise that we started our class definition off with a method called `initialize`. You can think of `initialize` as the function that “boots up” each object the class creates.
```ruby
class Person
  def initialize
    puts "Hello"
  end
end
```
## What's in a @name?
All right! Just one more step before we can create a person from our Person class: we have to make sure each person has a @name.

In Ruby, we use @ before a variable to signify that it’s an instance variable. This means that the variable is attached to the instance of the class.
```ruby
class Car
  def initialize(make, model)
    @make = make
    @model = model
  end
end

kitt = Car.new("Pontiac", "Trans Am")
```

The code in the example above creates an instance, kitt, of the class Car. kitt has his own @make (“Pontiac”) and @model (“Trans Am”). Those variables belong to the kitt instance, which is why they’re called instance variables.

We’ll cover other kinds of variables (like those attached to entire classes!) in the next few exercises.
```ruby
class Person
  def initialize(name)
    @name = name
  end
end
```

## Instantiating Your First Object
Perfect! Now we’re ready to start creating objects.

We can create an instance of a class just by calling .new on the class name, like so:
```ruby
me = Person.new("Eric") 
```

```ruby
class Person
  def initialize(name)
    @name = name
  end
end

matz = Person.new("Yukihiro")
```
## Scope it Out
Another important aspect of Ruby classes is scope. The scope of a variable is the context in which it’s visible to the program.

It may surprise you to learn that not all variables are accessible to all parts of a Ruby program at all times. When dealing with classes, you can have variables that are available everywhere (global variables), ones that are only available inside certain methods (local variables), others that are members of a certain class (class variables), and variables that are only available to particular instances of a class (instance variables).

The same goes for methods: some are available everywhere, some are only available to members of a certain class, and some are only available to particular instance objects.
```ruby
class Computer
  $manufacturer = "Mango Computer, Inc."
  @@files = {hello: "Hello, world!"}
  
  def initialize(username, password)
    @username = username
    @password = password
  end
  
  def current_user
    @username
  end
  
  def self.display_files
    @@files
  end
end

# Make a new Computer instance:
hal = Computer.new("Dave", 12345)

puts "Current user: #{hal.current_user}"
# @username belongs to the hal instance.

puts "Manufacturer: #{$manufacturer}"
# $manufacturer is global! We can get it directly.

puts "Files: #{Computer.display_files}"
# @@files belongs to the Computer class.
```
## Naming Your Variables
Recall that instance variables begin with an `@`. This isn’t just a Ruby convention—it’s part of the syntax! Always start your instance variables with `@`.

Class variables are like instance variables, but instead of belonging to an instance of a class, they belong to the class itself. Class variables always start with two `@`s, like so: `@@files`.

Global variables can be declared in two ways. The first is one that’s already familiar to you: you just define the variable outside of any method or class, and voilà! It’s global. If you want to make a variable global from inside a method or class, just start it with a `$`, like so: `$matz`.

We’ll go through instance and class variables in more detail in a moment. First, let’s do a quick review of local and global scop

## For Instance...
Good! A caveat, though: global variables can be changed from anywhere in your program, and they are generally not a very good idea. It’s much better to create variables with limited scope that can only be changed from a few places!

For example, instance variables belong to a particular object (or “instance”). Let’s get in some practice with instance variables! We’ve added our Person class from before to the editor.

## Twice the @, Twice as Classy
We can create class variables by starting a variable name with two @ symbols. Class variables are attached to entire classes, not just instances of classes, like so:
```ruby
class MyClass
  @@class_variable
end
```
Because there’s only one copy of a class variable shared by all instances of a class, we can use them to pull off some cool Ruby tricks. For example, we can use a class variable to keep track of the number of instances of that class we’ve created. Let’s do that now!

## Classes Are Serious Business
Classes like Language and Person are great when you are starting to learn the concepts of classes and instances.

However, classes and objects are often used to model real-world objects. The code in the editor is a more realistic demonstration of the kind of classes and objects you might find in commercial software. Here we have a snippet of the Rails source code. See how they’ve created an instance of the RecordInvalid class?
```ruby
def create_record(attributes, raise_error = false)
  record = build_record(attributes)
  yield(record) if block_given?
  saved = record.save
  set_new_record(record)
  raise RecordInvalid.new(record) if !saved && raise_error
  record
end
```

## Watch Your Step
Inheritance is a tricky concept, so let’s go through it step by step.

Inheritance is the process by which one class takes on the attributes and methods of another, and it’s used to express an is-a relationship. For example, a cartoon fox is a cartoon mammal, so a CartoonFox class could inherit from a CartoonMammal class.

However, a Wizard is not an Elf, so it shouldn’t inherit from the Elf class (even if they have a lot of magical attributes and methods in common). Instead, both Wizard and Elf could ultimately inherit from the same MagicalBeing class.
```ruby
class ApplicationError
  def display_error
    puts "Error! Error!"
  end
end

class SuperBadError < ApplicationError
end

err = SuperBadError.new
err.display_error
```
## Inheritance Syntax
In Ruby, inheritance works like this:
```ruby
class DerivedClass < BaseClass
  # Some stuff!
end
```
The derived class is the new class you’re making and the base class is the class from which that new class inherits. You can read “<“ as “inherits from.”
```ruby
class Application
  def initialize(name)
    @name = name
  end
end

# Add your code below!
class MyApp < Application
end
```