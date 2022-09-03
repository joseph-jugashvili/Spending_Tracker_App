class Database
  attr_accessor :users

  FILE_PATH = 'users.yml'

  def initialize
    @users = load_users
  end

  def add_user(user)
    @users << user
    update_database
  end

  def update_database
    File.open(FILE_PATH, 'w') { |file| file.write @users.to_yaml }
  end

  private

  def load_users
    return [] unless File.exist?(FILE_PATH)

    YAML.load_file(FILE_PATH)
  end
end
