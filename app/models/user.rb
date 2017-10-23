class User < ActiveRecord::Base
  has_secure_password

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, uniqueness: true, format: {with:EMAIL_REGEX}
  validates :fname, :lname, :email, presence:true

  before_save :downcase_fields

  has_many :groups
  has_many :joins, dependent: :destroy
  has_many :groups_joined,  through: :joins, source: :group
  

  def downcase_fields
      self.email.downcase!
  end
end
