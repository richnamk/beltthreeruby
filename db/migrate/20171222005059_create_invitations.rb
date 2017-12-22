class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :invitee_id 
      t.integer :invitor_id

      t.timestamps null: false
    end
  end
end
