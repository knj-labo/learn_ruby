## Need-to-Know Basis
You might be wondering why we need to hide information in Ruby. Isn’t it okay for every part of your Ruby program to know what every other part is doing?

Possibly, if you’re the only one writing and using your software. But when other people are working on or using your programs, they may attempt to muck around with the way different parts of your program do their jobs. You don’t want that!

For this reason, Ruby allows you to explicitly make some methods public and others private. Public methods allow for an interface with the rest of the program; they say, “Hey! Ask me if you need to know something about my class or its instances.”

Private methods, on the other hand, are for your classes to do their own work undisturbed. They don’t want anyone asking them anything, so they make themselves unreachable!
```rb
class Person
  def initialize(name, age)
    @name = name
    @age = age
  end
  
  public    # This method can be called from outside the class.
  
  def about_me
    puts "I'm #{@name} and I'm #{@age} years old!"
  end
  
  private   # This method can't!
  
  def bank_account_number
    @account_number = 12345
    puts "My bank account number is #{@account_number}."
  end
end

eric = Person.new("Eric", 26)
eric.about_me
eric.bank_account_number
```

## Quick Review: Building a Class
Let’s build a class!
```rb
class ClassName
  def method_name(parameter)
    @class_variable = parameter
  end
end
```
1. First we tell Ruby that we want to construct our class ClassName. Don’t forget the end to end your class!
2. Inside our ClassName is where we define our methods. Here we have method_name followed by (parameter), When we use this method it will look like this method_name("hello!")
3. If our parameter above were “Hello!” it would be assigned to our variable @class_variable on the following line. 
4. Again, don’t forget to end your method_name!

## Going Public
Great work! Now we’ll get into the details of public and private methods.

Methods are public by default in Ruby, so if you don’t specify public or private, your methods will be public. In this case, however, we want to make it clear to people reading our code which methods are public. We do this by putting public before our method definitions, like so:
```rb
class ClassName
  # Some class stuff
  public
  def public_method
    # public_method stuff
  end
end
```
Note that everything after the public keyword through the end of the class definition will now be public unless we say otherwise. (We’ll say otherwise in the next exercise.)
```rb
class Dog
  def initialize(name, breed)
    @name = name
    @breed = breed
  end

  public
  def bark
    puts "Woof!"
  end 
end
```
## Private! Keep Out!
Perfect! But not all our Ruby methods should be public.

Just as we use public to announce our public methods, we use private to specify our private ones:
```rb
class ClassName
 # Some class stuff
 public
 # Public methods go here
 def public_method; end
 
 private
 # Private methods go here
 def private_method; end
end
```
private methods are just that: they’re private to the object where they are defined. This means you can only call these methods from other code inside the object. Another way to say this is that the method cannot be called with an explicit receiver. You’ve been using receivers all along—these are the objects on which methods are called! Whenever you call object.method, object is the receiver of the method.

In order to access private information, we have to create public methods that know how to get it. This separates the private implementation from the public interface, and we’ll go over this in more detail in the next two exercises.
```rb
class Dog
  def initialize(name, breed)
    @name = name
    @breed = breed
  end

  public
  def bark
    puts "Woof!"
  end 

  private
  def id
    @id_number = 12345
  end
end
```

## attr_reader, attr_writer
We saw in the lesson on classes that Ruby needs methods in order to access attributes. For instance, if we want to access a @name instance variable, we had to write something like
```rb
def name
  @name
end
```
Well, no longer! We can use attr_reader to access a variable and attr_writer to change it. If we write
```rb
class Person
  attr_reader :name
  attr_writer :name
  def initialize(name)
    @name = name
  end
end
```
Ruby does something like this for us automatically:
```rb
def name
  @name
end

def name=(value)
  @name = value
end
```
Like magic, we can read and write variables as we please! We just pass our instance variables (as symbols) to attr_reader or attr_writer.

(That name= might look funny, but you’re allowed to put an = sign in a method name. That’s just a Ruby convention saying, “hey, this method sets a value!”)

## attr_accessor
If we want to both read and write a particular variable, there’s an even shorter shortcut than using `attr_reader` and `attr_writer`. We can use `attr_accessor` to make a variable readable and writeable in one fell swoop.
```rb
class Person
  attr_reader :name
  attr_accessor :job
  
  def initialize(name, job)
    @name = name
    @job = job
  end
end
```
## What's a Module?
You can think of a module as a toolbox that contains a set methods and constants. There are lots and lots of Ruby tools you might want to use, but it would clutter the interpreter to keep them around all the time. For that reason, we keep a bunch of them in modules and only pull in those module toolboxes when we need the constants and methods inside!

You can think of modules as being very much like classes, only modules can’t create instances and can’t have subclasses. They’re just used to store things!
```rb
module Circle

  PI = 3.141592653589793
  
  def Circle.area(radius)
    PI * radius**2
  end
  
  def Circle.circumference(radius)
    2 * PI * radius
  end
end
```

## Module Syntax
You can pull in pre-existing modules (we’ll show you how soon!), but you can also make your own. Modules are super easy to make! You just use the module keyword, like so:
```rb
module ModuleName
  # Bits 'n pieces
end
```
Like class names, module names are written in CapitalizedCamelCase, rather than lowercase_with_underscores.

It doesn’t make sense to include variables in modules, since variables (by definition) change (or vary). Constants, however, are supposed to always stay the same, so including helpful constants in modules is a great idea.

Ruby doesn’t make you keep the same value for a constant once it’s initialized, but it will warn you if you try to change it. Ruby constants are written in ALL_CAPS and are separated with underscores if there’s more than one word.

An example of a Ruby constant is PI, which lives in the Math module and is approximately equal to 3.141592653589793. We created our own PI in the previous exercise, but don’t worry: because they’re in separate modules, Ruby knows to keep them separate.