require_relative '../spec_helper'

RSpec.describe User do 
  let(:database) {Database.new}
  let(:login) {FFaker::Name.name}
  let(:password) {FFaker::Internet.password}
  let(:user) {User.new(login, password) }
  let(:category) {Category.new(FFaker::Lorem.word)}
  let(:record) {Record.new(user, FFaker::Number.number, category)}
  let(:wrong_login) {FFaker::Name.name}
  let(:wrong_password) {FFaker::Internet.password}
  before(:each) { database.add_user(user) }
  context "When user is created" do 
    it "checks if user is created" do 
      expect(database.users).not_to be_empty
    end
  end

  context "when user added category and record" do 
    before do 
      user.add_category(category)
      user.add_record(record)
    end
    it "checks if user create category" do 
      expect(user.categories).not_to be_empty 
    end
    it "checks if user create record" do
      expect(user.records).not_to be_empty
    end
    context "when user removed record" do
      before { user.remove_record(record) }
      it "checks if user remove recor" do
        expect(user.records).to be_empty
      end
    end
  end
  context "when user access" do 
    it "checks if user has access" do 
      expect(user.access?(login, password)).to be_truthy
    end
    it "checks if user has no access" do
      expect(user.access?(wrong_login, wrong_password)).to be_falsey
    end
  end
end 