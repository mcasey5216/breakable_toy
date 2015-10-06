class ContactSeeder
  CONTACTS = [
    {
      email: "plumber@gmail.com",
      first_name: "Joe",
      last_name: "Plumber",
      company_name: "Plumbers Inc",
      address: "33 Harrison Ave",
      city: "Boston",
      state: "MA",
      zip: "02111",
      phone: 1234567890,
      phone_ext: 123,
      category: "Plumbing",
      description: "closes at 5",
      group: Group.first
    }, {
      email: "electric@gmail.com",
      first_name: "Jim",
      last_name: "Electric",
      company_name: "Electrican Inc",
      address: "33 Harrison Ave",
      city: "Boston",
      state: "MA",
      zip: "02111",
      phone: 1234567890,
      phone_ext: 123,
      category: "Electrican",
      description: "closes at 6",
      group: Group.first
    }, {
      email: "lawyer@gmail.com",
      first_name: "John",
      last_name: "Lawyer",
      company_name: "Lawyer Inc",
      address: "33 Harrison Ave",
      city: "Boston",
      state: "MA",
      zip: "02111",
      phone: 1234567890,
      phone_ext: 123,
      category: "Lawyer",
      description: "closes at 8",
      group: Group.last
    }
  ]
  def self.seed!
    CONTACTS.each do |contact|
      Contact.create!(contact)
    end
  end
end
