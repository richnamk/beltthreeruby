class Invitation < ActiveRecord::Base
    belongs_to :invitor, foreign_key: 'invitor_id', class_name: 'User'
    belongs_to :invitee, foreign_key: 'invitee_id', class_name: 'User'
end
