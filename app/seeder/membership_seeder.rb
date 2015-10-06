class MembershipSeeder
  MEMBERSHIPS = [
    {
      group: Group.first,
      user: User.first
    }, {
      group: Group.last,
      user: User.last
    }
  ]
  def self.seed!
    MEMBERSHIPS.each do |membership|
      Membership.create!(membership)
    end
  end
end
