class Activity
  def initialize
    @history = []
  end

  attr_reader :history

  def save_deposit(amount, balance)
    @history << new_activity(amount, "", balance)
  end

  def save_withdrawal(amount, balance)
    @history << new_activity("", amount, balance)
  end

  private

  def current_date
    current_date = Time.now.strftime("%d/%m/%Y")
  end

  def new_activity(credit, debit, balance)
    {date: current_date, credit: credit, debit: debit, balance: balance}
  end

end