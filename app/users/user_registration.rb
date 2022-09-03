class UserRegistration
  include InputHelper

  def initialize(database)
    @database = database
  end

  def registration_data
    #loop do
      user_data = { login: login_input, password: password_input }
      #user_data
    #end
  end

  def login_input
    login = console_input('Enter your login')
    login
  end

  def password_input
    password = console_input('Enter your password')
    password
  end
end
