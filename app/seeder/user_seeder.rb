class UserSeeder
  USERS = [
    {
      email: "michelle@gmail.com",
      password: "password",
      password_confirmation: "password",
      first_name: "Michelle",
      last_name: "Casey",
      title: "Modeler",
      address: "33 Harrison Ave",
      city: "Boston",
      state: "MA",
      zip: "02111",
      phone: "2122850120"
    }, {
      email: "kris@gmail.com",
      password: "password",
      password_confirmation: "password",
      first_name: "Kris",
      last_name: "Wines",
      title: "Office Manager",
      address: "25 Maiden Lane",
      city: "New York",
      state: "NY",
      zip: "10038",
      phone: "2122850120"
    }, {
      email: "james@gmail.com",
      password: "password",
      password_confirmation: "password",
      first_name: "James",
      last_name: "Wines",
      title: "CEO",
      address: "25 Maiden Lane",
      city: "New York",
      state: "NY",
      zip: "10038",
      phone: "2122850120"
    },  {
      email: "matt@gmail.com",
      password: "password",
      password_confirmation: "password",
      first_name: "Matt",
      last_name: "Ginglesberg",
      title: "Lead Designer",
      address: "25 Maiden Lane",
      city: "New York",
      state: "NY",
      zip: "10038",
      phone: "2122850120"
    }, {
      email: "alex@gmail.com",
      password: "password",
      password_confirmation: "password",
      first_name: "Alex",
      last_name: "Donahue",
      title: "Intern",
      address: "25 Maiden Lane",
      city: "New York",
      state: "NY",
      zip: "10038",
      phone: "2122850120"
    }
  ]
  def self.seed!
    USERS.each do |user|
      User.create!(user)
    end
  end
end
