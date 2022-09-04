# frozen_string_literal: true

class UserRegistration
  include InputHelper

  def initialize(database)
    @database = database
  end

  def registration_data
    { login: login_input, password: password_input }
  end

  def login_input
    console_input('Enter your login')
  end

  def password_input
    console_input('Enter your password')
  end
end
