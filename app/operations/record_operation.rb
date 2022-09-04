# frozen_string_literal: true

require 'date'

class RecordOperation
  include InputHelper

  def initialize(database, user)
    @database = database
    @user = user
  end

  def create_record
    amount = console_input('Enter the amount').to_f
    category = console_input('Enter name of the category')
    if amount != 0
      if @user.categories.map(&:name).include? category
        @user.add_record(Record.new(@user, amount, category))
        @database.update_database
      else
        puts 'No such category, try again'
      end
    else
      puts 'Amount is not a number or equal zero, try again'
    end
  end

  def create_record_for_day
    amount = console_input('Enter the amount').to_f
    category = console_input('Enter name of the category')
    date = console_input('Input date in format DD.MM.YYYY')
    if amount != 0
      if @user.categories.map(&:name).include? category
        @user.add_record(Record.new(@user, amount, category, DateTime.strptime(date, '%d.%m.%Y')))
        @database.update_database
      else
        puts 'No such category, try again'
      end
    else
      puts 'Amount is not a number or equal zero, try again'
    end
  end
end
