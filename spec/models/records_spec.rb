RSpec.describe Record do
  let(:login) {FFaker::Name.name}
  let(:password) {FFaker::Internet.password}
  let(:user) {User.new(login, password)}
  let(:amount) {FFaker::Number.number}
  let(:category) {Category.new(FFaker::Lorem.word)}
  let(:record) {Record.new(user, amount, category)}
  it "validates the amount" do
    expect(record.amount).to eq amount
  end
  it "validates the category" do
    expect(record.category).to eq category
  end
end