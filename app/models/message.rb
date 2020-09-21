class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image #メッセージとイメージを紐付けるアソシエーション

  validates :content ,presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

end
