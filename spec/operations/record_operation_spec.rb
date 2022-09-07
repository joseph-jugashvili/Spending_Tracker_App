require 'date'

RSpec.describe RecordOperation do
  let(:name) {FFaker::Name.name}
  let(:category) {Category.new(name)}
  let(:database) {Database.new}
  let(:user) {User.new(FFaker::Name.name, FFaker::Internet.password)}
  let(:amount) {FFaker::Number.number}
  let(:date) {'12.09.2015'}
  let(:record) {Record.new(user, amount, category, date)}
  let(:record_operation) {RecordOperation.new(database, user)}
  let(:category_operation) {CategoryOperation.new(database, user)}
  let(:file_name) {'./spec/fixtures/records.yml'}
  context "when record was created" do
    before do 
      stub_const('Database::FILE_PATH', file_name)
      allow(record_operation).to receive(:console_input).and_return(amount, name, date)
      allow(category_operation).to receive(:console_input).and_return(name)
      database.add_user(user) 
      category_operation.create_category_operation
    end
    after do
      File.delete(Database::FILE_PATH) if File.exist?(Database::FILE_PATH)
    end

    it "create record" do
      expect{record_operation.create_record}.to change{user.records.length}.by 1
    end

    it "create record per date" do
      expect{record_operation.create_record_for_day}.to change{user.records.length}.by 1
    end
  end
end