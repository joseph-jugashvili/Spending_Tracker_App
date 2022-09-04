# frozen_string_literal: true

class User
  attr_reader :categories, :records, :login

  def initialize(login, password)
    @categories = []
    @login = login
    @password = password
    @records = []
  end

  def add_record(new_record)
    @records << new_record
  end

  def remove_record(record)
    @records.delete(record)
  end

  def add_category(new_category)
    @categories << new_category
  end

  def access?(login, password)
    login == @login && password == @password
  end
end
