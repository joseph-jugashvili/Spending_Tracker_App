# frozen_string_literal: true

class UserLogIn
  include InputHelper

  def initialize(database)
    @database = database
  end

  def log_in
    user = receieve_account
    if user.nil?
      puts 'No such account'
      log_in
    else
      user
    end
  end

  def receieve_account
    login = console_input('Enter your login')
    password = console_input('Enter your password')

    @database.users.detect { |user| user.access? login, password }
  end
end
