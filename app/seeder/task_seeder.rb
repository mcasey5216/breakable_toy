class TaskSeeder
  TASKS = [
    {
      group: Group.first,
      title: "Task 1",
      description: "This is the first task",
      completed: false
    }, {
      group: Group.first,
      title: "Task 2",
      description: "This is the second task",
      completed: false
    }, {
      group: Group.last,
      title: "Task 3",
      description: "This is the third task",
      completed: false
    }
  ]
  def self.seed!
    TASKS.each do |task|
      Task.create!(task)
    end
  end
end
