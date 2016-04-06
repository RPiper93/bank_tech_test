require "account"

describe Account do
  subject(:account) {described_class.new}

  context "A new account" do
    it "is created with an empty balance" do
      expect(account.balance).to eq Account::INITIAL_BALANCE
    end
  end

  describe '#deposit' do
    it "can deposit into the account" do
      expect{account.deposit(5.00)}.to change{account.balance}.by 5.00
    end
  end

  describe '#withdraw' do
    it "can withdraw money from the account" do
      account.deposit(5.00)
      expect{account.withdraw(2.00)}.to change{account.balance}.by -2.00
    end
  end
end