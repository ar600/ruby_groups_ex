class Group < ActiveRecord::Base
  belongs_to :user
  has_many :joins , dependent: :destroy
  has_many :users, through: :joins, source: :user


  validates :name, presence:true, length: { minimum: 5}
  validates :description, length: { minimum: 10}
end
