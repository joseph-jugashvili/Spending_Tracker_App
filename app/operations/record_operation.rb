class RecordOperation
  include InputHelper

  def initialize(database, user)
    @database = database
    @user = user
  end

  def create_record
    amount = console_input("Enter the amount").to_f
    category = console_input("Enter name of the category")
    @user.add_record(Record.new(@user, amount, category))
    @database.update_database
  end
end