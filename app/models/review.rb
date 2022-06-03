class Review < ApplicationRecord
  belongs_to :boat
  validates :content, length: {minimum: 20}
end
