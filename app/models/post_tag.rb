class PostTag < ApplicationRecord
  belongs_to :creature
  belongs_to :tag
end
