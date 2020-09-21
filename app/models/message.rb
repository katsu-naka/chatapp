class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_atteched :image #メッセージとイメージを紐付けるアソシエーション

  validates :content ,presence: true
end
