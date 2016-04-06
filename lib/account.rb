class Account
  INITIAL_BALANCE = 0.00

  def initialize
    @balance = INITIAL_BALANCE
  end

  attr_reader :balance

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end