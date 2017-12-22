class AddInvitedToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :invited, :boolean, default: false
  end
end
