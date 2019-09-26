require './lib/users.rb'

describe Users do
  describe '#add_user' do
    it 'adds a user to the database, returns new instance of user with ID stored' do
      Users.add_user(name: "Dan Gyi", email: "dan@gmail.com", password: "test123" )
      all_users = Users.all_users
      expect(all_users[0]['name']).to eq("Dan Gyi")
    end
  end

  describe '#authenticate' do
    it 'creates new instance of user on passed authentication' do
      Users.add_user(name: "Dan Gyi", email: "dan@gmail.com", password: "test123" )
      expect(Users.authenticate(email: "dan@gmail.com", password: "test123")).to be_kind_of(Users)
    end

    it 'returns false if login authentication failed' do
      Users.add_user(name: "Dan Gyi", email: "dan@gmail.com", password: "test123" )
      expect(Users.authenticate(email: "daan@gmail.com", password: "test1234")).to be(false)
    end

  end


end