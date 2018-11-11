class Mood < ApplicationRecord
belongs_to :user
belongs_to :family

  def friendly_created_at
    created_at.strftime("%A, %b %d")
  end

  enum emotion: {scared: 0, angry: 1, sad: 2, meh: 4, happy: 5}

  validates :emotion, presence: true

  validates :message, presence: true 
  validates :message, length: { minimum: 5 }
  validates :message, length: { maximum: 100 }
end
