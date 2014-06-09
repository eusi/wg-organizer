class CreateShoutboxmessages < ActiveRecord::Migration
  def change
    create_table :shoutboxmessages do |t|
	t.text :message
    t.timestamps
	t.references :User, index: true
    end
  end
end
