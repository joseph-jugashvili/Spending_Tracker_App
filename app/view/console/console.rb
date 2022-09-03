require 'date'

class Console
  include InputHelper

  attr_reader :current_user

  COMMANDS = {
    "CC" => :create_category,
    "CR" => :create_record,
    "DS" => :day_statistics,
    "MS" => :month_statistics,
    "YS" => :year_statistics
  }

  def initialize
    @database = Database.new
  end

  def console
    puts "Please create a new accout or log in to start\nEnter 'add user' to create a new account \nEnter 'log in' to log in\nEnter 'exit' to close application"
    command = gets.chomp
    case command
    when 'add user' then add_account
    when 'log in' then login_user
    else exit end
  end

  def add_account
    registration = UserRegistration.new(@database)
    user_data = registration.registration_data
    @current_user = User.new(user_data[:login], user_data[:password])
    @database.add_user(@current_user)
    main_menu
  end

  def login_user
    return create_first_user if @database.users.none?

    authorization = UserLogIn.new(@database)
    @current_user = authorization.log_in
    main_menu
  end

  def create_first_user
    answer = console_input("There is no active accounts, do you want to be the first?[y/n]")
    answer == ('y') ? add_account : console
  end
  
  def main_menu
    loop do
      puts("Welcome " + @current_user.login + "\nList of avaliable commands: \nTo add a new category with spendings - CC \nTo add spendings to an existing category - CR \nTo see spending per day - DS \nTo see spending per month - MS \nTo see spending per year - YS")
      command = console_input
      exit if command == "exit"
      return public_send(COMMANDS[command]) if COMMANDS.keys.include?(command)

      puts("Wrong command, try again")
      end  
  end

  def create_category
    CategoryOperation.new(@database, @current_user).create_category_operation
    main_menu
  end

  def create_record
    RecordOperation.new(@database, @current_user).create_record
    main_menu
  end

  def day_statistics
    date = console_input("Input date in format DD.MM.YYYY")
    puts Statistics.per_day(@current_user, DateTime.strptime(date, '%d.%m.%Y'))
  end

  def month_statistics
    date = console_input("Input date in format MM.YYYY")
    puts Statistics.per_month(@current_user, DateTime.strptime(date, '%m.%Y'))
  end

  def year_statistics
    date = console_input("Input date in format YYYY")
    puts Statistics.per_year(@current_user, DateTime.strptime(date, '%Y'))
  end
end
