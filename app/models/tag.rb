class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  # 中間テーブルであるpost_tagモデルを介してのcreatureモデルとの関連付け
  has_many :creatures, through: :post_tags
end
