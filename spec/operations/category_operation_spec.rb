RSpec.describe CategoryOperation do
  let(:name) {FFaker::Name.name}
  let(:category) {Category.new(name)}
  let(:database) {Database.new}
  let(:user) {User.new(FFaker::Name.name, FFaker::Internet.password)}
  let(:category_operation) {CategoryOperation.new(database, user)}
  let(:file_name) {'./spec/fixtures/categories.yml'}
  context "when category was created" do
    before do 
      stub_const('Database::FILE_PATH', file_name)
      allow(category_operation).to receive(:console_input).and_return(name)
      database.add_user(user) 
    end
    after do
      File.delete(Database::FILE_PATH) if File.exist?(Database::FILE_PATH)
    end

    it "create category" do
      expect{category_operation.create_category_operation}.to change{user.categories.length}.by 1
    end
  end
end