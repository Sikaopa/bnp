class Review < ApplicationRecord
  belongs_to :boat
  belongs_to :user
  validates :content, length: {minimum: 20}
end
