class UserSeeder
  USERS = [
    {
      email: "michelle@gmail.com",
      password: "password",
      password_confirmation: "password",
      first_name: "Michelle",
      last_name: "Casey",
      title: "Coder",
      address: "33 Harrison Ave",
      city: "Boston",
      state: "MA",
      zip: "02111",
      phone: "1234567890"
    }, {
      email: "bob@gmail.com",
      password: "password",
      password_confirmation: "password",
      first_name: "Bob",
      last_name: "Hope",
      title: "Coder",
      address: "33 Harrison Ave",
      city: "Boston",
      state: "MA",
      zip: "02111",
      phone: "1234567890"
    }
  ]
  def self.seed!
    USERS.each do |user|
      User.create!(user)
    end
  end
end
