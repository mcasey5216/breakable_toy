class MembershipSeeder
  MEMBERSHIPS = [
    {
      group: Group.first,
      user: User.first,
      task: Task.first
    }, {
      group: Group.first,
      user: User.last,
      task: Task.first
    }, {
      group: Group.last,
      user: User.first,
    }
  ]
  def self.seed!
    MEMBERSHIPS.each do |membership|
      Membership.create!(membership)
    end
  end
end
