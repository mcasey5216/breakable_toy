class GroupSeeder
  GROUPS = [
    {
      name: "Design Devolpment",
      primary_user: User.first,
      description: "This groups is for development related ideas"
    }
  ]
  def self.seed!
    GROUPS.each do |group|
      Group.create!(group)
    end
  end
end
