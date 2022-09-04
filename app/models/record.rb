# frozen_string_literal: true

class Record
  attr_reader :amount, :category, :created_at

  def initialize(user, amount, category, created_at = nil)
    @user = user
    @amount = amount
    @category = category
    @created_at = created_at || Time.now
  end
end
