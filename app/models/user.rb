class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable

  # This access the Relationship object
  has_many :followed_users,
           foreign_key: :follower_id,
           class_name: 'Relationship',
           dependent: :destroy

  # This access the User object through the Relationship object
  has_many :followees, through: :followed_users, dependent: :destroy

  has_many :following_users,
           foreign_key: :followee_id,
           class_name: 'Relationship',
           dependent: :destroy

  has_many :followers, through: :following_users, dependent: :destroy

  has_many :routines, dependent: :destroy
end
