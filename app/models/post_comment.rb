class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :creature

  validates :content, presence: true
end
