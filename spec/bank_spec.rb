require "bank"

describe Bank do
  subject(:bank) {described_class.new}
  let(:date) { Time.now.strftime("%d/%m/%Y") }

  context "depositing to account" do
    it "adds money to balance when depositing money" do
      expect{bank.deposit(5.00)}.to change{bank.balance}.by 5.00
    end

    it "saves activity when depositing money" do
      saved_hash = {date: date, credit: 200.00, debit: "", balance: 200.00}
      bank.deposit(200.00)
      expect(bank.activity.last).to eq saved_hash
    end
  end

  context "withdrawing from account" do
    before do
      bank.deposit(200.00)
    end

    it "removes money from balance when withdrawing money" do
      expect{bank.withdraw(10.00)}.to change{bank.balance}.by -10.00
    end
  end
end