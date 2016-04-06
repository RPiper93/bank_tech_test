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
      expect{account.deposit(5)}.to change{account.balance}.by 5
    end
  end

  describe '#withdraw' do
    it "can withdraw money from the account" do
      account.deposit(5)
      expect{account.withdraw(2)}.to change{account.balance}.by 2
    end
  end
end