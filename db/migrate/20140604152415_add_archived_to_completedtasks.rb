class AddArchivedToCompletedtasks < ActiveRecord::Migration
  def change
    add_column :completedtasks, :is_archived, :booelan, :default => false
  end
end
