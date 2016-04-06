require "activity"

describe Activity do
  subject(:activity) { described_class.new }
  let(:date) { Time.now.strftime("%d/%m/%Y") }

  context "storing activity" do
    it "initializes with a blank history" do
      expect(activity.history).to eq []
    end

    it "stores deposit information" do
      saved_hash = {date: date, credit: 200.00, debit: "", balance: 200.00}
      activity.save_deposit(200.00, 200.00)
      expect(activity.history.last).to eq saved_hash
    end

    it "stores withdrawal information" do
      saved_hash = {date: date, credit: "", debit: 100.00, balance: 100.00}
      activity.save_withdrawal(100.00, 100.00)
      expect(activity.history.last).to eq saved_hash
    end
  end
end