require 'date'

RSpec.describe Statistics do
  let(:login) {FFaker::Name.name}
  let(:password) {FFaker::Internet.password}
  let(:user) {User.new(login, password)}
  let(:first_category) {Category.new(FFaker::Lorem.word)}
  let(:second_category) {Category.new(FFaker::Lorem.word)}
  let(:third_category) {Category.new(FFaker::Lorem.word)}
  let(:categories) {[first_category, second_category, third_category]}
  let(:first_date) {DateTime.strptime('12.09.2015', '%d.%m.%Y')}
  let(:second_date) {DateTime.strptime('14.05.2000', '%d.%m.%Y')}
  let(:first_record) {Record.new(user, FFaker::Number.number, first_category, first_date)}
  let(:second_record) {Record.new(user, FFaker::Number.number, second_category, first_date)}
  let(:third_record) {Record.new(user, FFaker::Number.number, second_category, first_date)} 
  context "with categories check" do
    before do
      user.add_record(first_record)
      user.add_record(second_record)
      user.add_record(third_record)
    end
    context "with one category chosen" do 
      context "when categories have records" do
        it "one record in category" do
          expect(Statistics.by_category(user, first_category)).to eq first_record.amount
        end

        it "two records in category" do
          expect(Statistics.by_category(user, second_category)).to eq(second_record.amount + third_record.amount)
        end
      end

      context "when categories have no records" do
        it "no records in category" do
          expect(Statistics.by_category(user, third_category)).to eq 0
        end
      end
    end

    context "with multiple categories chosen" do

      it "show all records in all categories" do
        expect(Statistics.by_all_categories(user, categories)).to eq(first_record.amount + second_record.amount + third_record.amount)
      end
    end
  end

  context "with date check" do
    before do
      user.add_record(first_record)
      user.add_record(second_record)
      user.add_record(third_record)
    end
    context "records per day" do      
      it "show no records per day" do
        expect(Statistics.per_day(user, second_date)).to eq(0)
      end

      it "show all records per day" do
        expect(Statistics.per_day(user, first_date)).to eq (first_record.amount + second_record.amount + third_record.amount)
      end
    end
    
    context "records per month" do      
      it "show no records per month" do
        expect(Statistics.per_month(user, second_date)).to eq(0)
      end

      it "show all records per month" do
        expect(Statistics.per_month(user, first_date)).to eq (first_record.amount + second_record.amount + third_record.amount)
      end
    end

    context "records per year" do      
      it "show no records per year" do
        expect(Statistics.per_year(user, second_date)).to eq(0)
      end

      it "show all records per year" do
        expect(Statistics.per_year(user, first_date)).to eq (first_record.amount + second_record.amount + third_record.amount)
      end
    end
  end
end
