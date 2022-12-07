## Create Your Class
All right! Let’s go ahead and set up our class.
```rb
class Computer
  def initializee
  end
end
```

## Fancify Your Initialize Method
Well done! Now let’s spice up our initialize method by passing it some parameters and setting some instance variables.

```rb
class Computer
  def initialize(username, password)
    @username = username
    @password = password
    @files = Hash.new()
  end
end
```

## Have a Little Class
Let’s go ahead and toss in a class variable. We’ll use the variable @@users to keep track of all the users on our computer.
```rb
class Computer
  @@users = Hash.new() 
  def initialize(username, password)
    @@users[username] = password
    @files = Hash.new()
  end
end
```

## Getting More Creative
Excellent! Our class is coming together, but it’s a bit boring. Let’s add another method, create. We’ll want to do a few things in it:
```rb
class Computer
  @@users = Hash.new() 
  def initialize(username, password)
    @@users[username] = password
    @files = Hash.new()
  end

  def create(filename)
    time = Time.now 
    @files[filename] = time

    puts "create file!"
  end
end
```

## Who are the Users?
Perfect! Now that we think of it, though, we could have a whole bunch of users creating files every which where, and we don’t have a way of getting to our @@users class variable! We’ll need to create a method to reach it.

Because @@users is a class variable, we’ll use a class method to grab it. Most of the methods you’ve seen so far are instance methods—they work on a particular instance/object, such as “matz” or “blixy”. A class method belongs to the class itself, and for that reason, it’s prefixed with the class name.
```rb
class Machine
  def Machine.hello
    puts "Hello from the machine!"
  end
end
```

```rb
class Computer
  @@users = Hash.new() 
  def initialize(username, password)
    @@users[username] = password
    @files = Hash.new()
  end

  def create(filename)
    time = Time.now 
    @files[filename] = time

    puts "create file!"
  end
  def Computer.get_users()
    return @@users
  end
end
```

## Instantiation Nation
Excellent! Last step: let’s create an instance of our Computer class.

You’ve done this before, but here’s a refresher.
```rb
class Person
  def initialize(name)
    @name = name
  end
end

emma = Person.new("emma")
```
In the example above, we first define a Person class with an initialize method.
Then, we create a new instance of Person and store it in a new variable called emma.
```rb
class Computer
  @@users = Hash.new() 
  def initialize(username, password)
    @@users[username] = password
    @files = Hash.new()
  end

  def create(filename)
    time = Time.now 
    @files[filename] = time

    puts "create file!"
  end
  def Computer.get_users()
    return @@users
  end
end

my_computer = Computer.new('kenji', 'password')
```