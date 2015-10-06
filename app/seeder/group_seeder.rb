class GroupSeeder
  GROUPS = [
    {
      name: "Best Group Ever",
      primary_user: User.first,
      description: "This group likes to be the best"
    }, {
      name: "Second Best Group Ever",
      primary_user: User.last,
      description: "This group likes to be the second best"
    }
  ]
  def self.seed!
    GROUPS.each do |group|
      Group.create!(group)
    end
  end
end
