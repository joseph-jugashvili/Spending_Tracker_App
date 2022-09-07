RSpec.describe UserRegistration do
  let(:database) {Database.new}
  let(:login) {FFaker::Name.name}
  let(:password) {FFaker::Internet.password}
  let(:user_registration) {UserRegistration.new(database)}
  let(:registration_data) {{ login: login, password: password }}
  context "with user registration data" do
    before do 
      allow(user_registration).to receive(:console_input).and_return(login, password)
    end
    it "user is registrated" do
      expect(user_registration.registration_data).to eq registration_data
    end
  end
end