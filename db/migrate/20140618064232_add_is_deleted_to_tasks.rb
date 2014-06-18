class AddIsDeletedToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :is_deleted, :boolean
  end
end
