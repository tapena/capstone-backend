class User < ApplicationRecord
  has_secure_password
  belongs_to :family
  
  has_many :moods

  validates :name, uniqueness: true
  validates :family_id, presence: true

end
