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

    it "saves activity when withdrawing money" do
      saved_hash = {date: date, credit: "", debit: 100.00, balance: 100.00}
      bank.withdraw(100.00)
      expect(bank.activity.last).to eq saved_hash
    end
  end

  context "viewing statements" do
    before do
      bank.deposit(400.00)
      bank.withdraw(50.00)
    end

    it "shows latest activity" do
      statement = "date || credit || debit || balance\n#{date} ||  || 50.00 || 350.00"
      expect(bank.latest_activity).to eq statement
    end

    it "prints whole statement" do
      statement = "date || credit || debit || balance\n#{date} ||  || 50.00 || 350.00\n#{date} || 400.00 ||  || 400.00"
      expect(bank.print_statement).to eq statement
    end
  end
end