class User < ApplicationRecord

  include Devise::JWT::RevocationStrategies::JTIMatcher

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  # enum role: { player: 0, admin: 1 }
  # after_create :send_user_welcome_mail

  # has_many :players
  validates :email, presence: true, uniqueness: true

  def token
    token, _payload = Warden::JWTAuth::UserEncoder.new.call(self, :user, nil)
    token
  end

  # def send_user_welcome_mail
  #   UserMailer.with(user: self).welcome_email.deliver_now
  # end
end
