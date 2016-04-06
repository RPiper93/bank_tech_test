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
  end
end