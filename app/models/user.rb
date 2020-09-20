#rails g devise userで生成されたファイル
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true #nameが空の場合にはデータベースに保存しない

  has_many :room_users
  has_many :rooms, through: :room_users
end
