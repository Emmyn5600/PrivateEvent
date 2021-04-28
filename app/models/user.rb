class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :creates, dependent: :destroy

  validates :username, presence: true, length: { minumum: 2, maximum: 30 }, uniqueness: true
end
