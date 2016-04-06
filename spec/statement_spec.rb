require "statement"

describe Statement do
  subject(:statement) {described_class.new}
  let(:deposit) { {date: date, credit: 200.00, debit: "", balance: 200.00} }
  let(:withdrawal) { {date: date, credit: "", debit: 100.00, balance: 100.00} }
  let(:history) { [deposit, withdrawal] }
  let(:date) { Time.now.strftime("%d/%m/%Y") }

  it "returns statement of last activity" do
    latest_statement = "date || credit || debit || balance\n#{date} ||  || 100.00 || 100.00"
    expect(statement.latest(history)).to eq latest_statement
  end

  it "prints statement of history from most recent to least recent" do
    full_statement = "date || credit || debit || balance\n#{date} ||  || 100.00 || 100.00\n#{date} || 200.00 ||  || 200.00"
    expect(statement.full(history)).to eq full_statement
  end
end
