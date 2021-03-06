class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, UserImageUploader


  has_many :likes

  has_many :prototypes, dependent: :destroy
  has_many :comments, dependent: :destroy


  validates :name, presence: true
end
