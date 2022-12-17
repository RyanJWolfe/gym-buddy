class User < ApplicationRecord
  attr_writer :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable
  # This access the Relationship object
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Relationship', dependent: :destroy
  # This access the User object through the Relationship object
  has_many :followees, through: :followed_users, dependent: :destroy
  # This access the Relationship object
  has_many :following_users, foreign_key: :followee_id, class_name: 'Relationship', dependent: :destroy
  # This access the User object through the Relationship object
  has_many :followers, through: :following_users, dependent: :destroy
  has_many :routines, dependent: :destroy
  has_many :workouts, dependent: :destroy

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  # only allow letter, number, underscore and punctuation.
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  # https://github.com/heartcombo/devise/wiki/How-To:-Allow-users-to-sign-in-using-their-username-or-email-address
  def login
    @login || username || email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.key?(:username) || conditions.key?(:email)
      conditions[:email]&.downcase!
      where(conditions.to_h).first
    end
  end
end
