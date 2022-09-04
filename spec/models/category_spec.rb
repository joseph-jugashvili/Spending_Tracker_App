RSpec.describe Category do
  let(:name) {FFaker::Lorem.word}
  let(:category) {Category.new(name)}
  it "validates the name" do
    expect(category.name).to eq name
  end
end