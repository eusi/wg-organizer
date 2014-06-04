class AddArchivedToCompletedtasks < ActiveRecord::Migration
  def change
    add_column :completedtasks, :is_archived, :boolean, :default => 0
  end
end
