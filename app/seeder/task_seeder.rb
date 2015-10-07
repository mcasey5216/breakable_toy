class TaskSeeder
  TASKS = [
    {
      group: Group.first,
      title: "Brainstorming",
      description: "Please discuss ideas here.",
      completed: false
    }
  ]
  def self.seed!
    TASKS.each do |task|
      Task.create!(task)
    end
  end
end
