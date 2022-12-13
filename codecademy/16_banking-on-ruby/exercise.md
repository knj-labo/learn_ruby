## What You'll Be Building
All right! Now that you know how to control the level of privacy in a Ruby class, we can use that to our advantage when creating objects. In this case, we’ll be making an Account object with public methods to display balances and transfer funds, but which rely on private methods to make sure the user’s PIN (personal identification number) is correct before approving transactions.

Note: We’re just using banking as an example because it’s a nice real-world analogy. This isn’t for real banking, so don’t use any real banking information!
```rb
class Account
  attr_reader :name, :balance
  def initialize(name, balance=100)
    @name = name
    @balance = balance
  end
  
  def display_balance(pin_number)
    puts pin_number == pin ? "Balance: $#{@balance}." : pin_error
  end
  
  def withdraw(pin_number, amount)
    if pin_number == pin
      @balance -= amount
      puts "Withdrew #{amount}. New balance: $#{@balance}."
    else
      puts pin_error
    end
  end
  
  private
  
  def pin
    @pin = 1234
  end
  
  def pin_error
    "Access denied: incorrect PIN."
  end
end

my_account = Account.new("Eric", 1_000_000)
my_account.withdraw(11, 500_000)
my_account.display_balance(1234)
my_account.withdraw(1234, 500_000)
my_account.display_balance(1234)
```
## Creating the Account Class
We’ll start off by creating our Account class. First, though, you probably noticed this bit of fanciness in the last exercise:
```rb
def initialize(name, balance=100)
  @name = name
  @balance = balance
```
What’s that balance=100 doing? It’s signifying an optional parameter. Ruby is saying that you can pass one or two arguments to initialize; if you pass two, it uses your balance argument to set @balance; if you only pass a name, balance gets a default value of 100, and that’s what gets stored in @balance.

You probably also noticed we used underscores in our 1_000_000 (one million). Ruby allows this, and it makes it easier to read big numbers! Cool, no?
```rb
class Account
  attr_reader :name, :balance
  def initialize(name, balance=100)
    @name = name
    @balance = balance
  end
end
```
## Private Affairs
Let’s go ahead and create our private methods. (It makes sense to create these first, since our public methods will rely on them.)
```rb
class Account
  attr_reader :name, :balance
  def initialize(name, balance=100)
    @name = name
    @balance = balance
  end

  private
  def pin
    @pin = 1234
  end

  def pin_error
    "Access denied: incorrect PIN."
  end
end
```
## Displaying the Balance
Perfect! Now let’s tackle the first public method, display_balance, which we’ll use to display our current account balance.
```rb
class Account
  attr_reader :name, :balance
  def initialize(name, balance=100)
    @name = name
    @balance = balance
  end

  def display_balance(pin_number)
    puts pin_number == pin ? "Balance: $#{@balance}." : pin_error
  end

  private
  def pin
    @pin = 1234
  end

  def pin_error
    "Access denied: incorrect PIN."
  end
end
```
## Making a Withdrawal
Well done! Now let’s add in our second public method, which will allow us to withdraw money from our account.

The trick to this one is to realize that since @balance can only be accessed from inside the class, we’ll want to use @balance -= amount to decrease the balance by a certain amount.