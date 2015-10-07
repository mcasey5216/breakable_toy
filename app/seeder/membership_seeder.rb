class MembershipSeeder
  MEMBERSHIPS = [
    {
      group: Group.first,
      user: User.first,
      task: Task.first
    }
  ]
  def self.seed!
    MEMBERSHIPS.each do |membership|
      Membership.create!(membership)
    end
  end
end
