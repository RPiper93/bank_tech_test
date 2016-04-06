require "statement"
require "account"
require "activity"

class Bank
  def initialize
    @account = Account.new
    @activity = Activity.new
  end

  def balance
    @account.balance
  end

  def activity
    @activity.history
  end

  def deposit(amount)
    @account.deposit(amount)
    @activity.save_deposit(amount, balance)
  end

  def withdraw(amount)
    @account.withdraw(amount)
    @activity.save_withdrawal(amount, balance)
  end

  def latest_activity
    Statement.new.latest(activity)
  end

  def print_statement
    Statement.new.full(activity)
  end
end