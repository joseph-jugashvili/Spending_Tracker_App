class CategoryOperation
  include InputHelper

  def initialize(database, user)
    @database = database
    @user = user
  end

  def create_category_operation
    name = console_input("Enter the name of the category")
    @user.add_category(Category.new(name))
    @database.update_database
  end
end