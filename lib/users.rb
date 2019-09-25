require './lib/database_connection.rb'
require './lib/database_connection_setup.rb'
require 'date'
require 'bcrypt'

class Users

  attr_reader :user_id

  def initialize(user_id:)
    @user_id = user_id
    
  end

  def self.all_users
    @all_users = []
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map { |user| @all_users << user }
    @all_users
  end

  def self.add_user(name:, email:,  password:)
    check_email_exist = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';")
    return if check_email_exist.any?

    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (name, email, password) VALUES ('#{name}', '#{email}', '#{encrypted_password}') RETURNING id")
    Users.new(user_id: result[0]['id'])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    
    return unless BCrypt::Password.new(result[0]['password']) == password
    Users.new(user_id: result[0]['id'])
  end

end