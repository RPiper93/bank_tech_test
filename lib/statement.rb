class Statement


  def latest(activities)
    latest = activities.last
    heading + "\n#{latest[:date]} || #{credit(latest)} || #{debit(latest)} || #{latest[:balance]}0"
  end

  def full(activities)
    statement = heading
    all_activities(activities.reverse, statement)
    statement
  end

  private

  def heading
    "date || credit || debit || balance"
  end

  def credit(activity)
    "#{activity[:credit]}0" if activity[:credit]!= ""
  end

  def debit(activity)
    "#{activity[:debit]}0" if activity[:debit]!=""
  end

  def all_activities(activities, string)
    activities.each do |activity|
      add_activity(string, activity)
    end
  end

  def add_activity(string, activity)
    string << "\n#{activity[:date]} || #{credit(activity)} || #{debit(activity)} || #{activity[:balance]}0"
  end
end