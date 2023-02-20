class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :creature

  validates :comment, presence: true
end
