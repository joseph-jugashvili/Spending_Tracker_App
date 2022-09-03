class Statistics
  def self.per_day(user, date)
    user.records.select { |record| record.created_at.day == date.day}.sum(&:amount)
  end

  def self.per_month(user, date)
    user.records.select { |record| record.created_at.month == date.month}.sum(&:amount)
  end

  def self.per_year(user, date)
    user.records.select { |record| record.created_at.year == date.year}.sum(&:amount)
  end
end