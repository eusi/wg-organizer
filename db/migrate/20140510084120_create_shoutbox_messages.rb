class CreateShoutboxMessages < ActiveRecord::Migration
  def change
    create_table :shoutbox_messages do |t|
	t.text :Message
    t.timestamps
	t.references :user, index: true
    end
  end
end
