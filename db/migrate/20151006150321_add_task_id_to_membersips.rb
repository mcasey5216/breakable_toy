class AddTaskIdToMembersips < ActiveRecord::Migration
  def change
    add_column :memberships, :task_id, :integer
  end
end
