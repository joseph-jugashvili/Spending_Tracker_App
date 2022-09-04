# frozen_string_literal: true

class Statistics
  def self.per_day(user, date)
    user.records.select { |record| record.created_at.day == date.day }.sum(&:amount)
  end

  def self.per_month(user, date)
    user.records.select { |record| record.created_at.month == date.month }.sum(&:amount)
  end

  def self.per_year(user, date)
    user.records.select { |record| record.created_at.year == date.year }.sum(&:amount)
  end

  def self.by_category(user, category)
    user.records.select { |record| record.category == category }.sum(&:amount)
  end

  def self.by_all_categories(user, _categories)
    user.records.sum(&:amount)
  end
end
