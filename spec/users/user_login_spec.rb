RSpec.describe UserLogIn do
  let(:database) {Database.new}
  let(:login) {FFaker::Name.name}
  let(:password) {FFaker::Internet.password}
  let(:user) {User.new(login, password)}
  let(:user_login) {UserLogIn.new(database)}
  before { database.add_user(user) }
  context "with user logged in" do
    before do 
      allow(user_login).to receive(:console_input).and_return(login, password)
    end
    it "user is logged in" do
      expect(user_login.log_in).to eq user
    end
  end
  context "with user not logged in" do
    before do 
      allow(user_login).to receive(:console_input).and_return('test', 'test')
    end
    it "user is not logged in" do
      expect(user_login).to receive(:log_in)
      user_login.log_in
    end
  end
end