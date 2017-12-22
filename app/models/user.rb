class User < ActiveRecord::Base
  has_many :invitors, foreign_key: 'invitor_id', class_name: 'Invitation'
  has_many :invitees, through: :invitors, source: :invitee

  has_many :invitees, foreign_key: 'invitee_id', class_name: 'Invitation'
  has_many :invitors, through: :invitees, source: :invitor


  has_secure_password

  before_save :downcase

  validates :name, presence: true
  validates :email, uniqueness: {case_sensitive: false }, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i}
  validates :password, length: { minimum: 8 }
  validates :description, presence: true, length: { minimum: 5 }

  def downcase
    self.name.downcase!
    self.email.downcase!
  end

end
