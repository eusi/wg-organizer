class AddArchivedToCharges < ActiveRecord::Migration
  def change
    add_column :charges, :is_archived, :boolean, :default => 0
  end
end
