class User < ApplicationRecord
  # == Extensions ===========================================================
	include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  # == Constants ============================================================

  # == Attributes ===========================================================
  enum role: { player: 0, admin: 1 }

  # == Callbacks ============================================================
  after_create :send_user_welcome_mail

  # == Relationships ========================================================
  has_many :players

  # == Validations ==========================================================
  validates :email, presence: true, uniqueness: true
  # validates :email, format: URI::MailTo::EMAIL_REGEXP

  # == Scopes ===============================================================

  # == Instance Methods =====================================================
  def token
    token, _payload = Warden::JWTAuth::UserEncoder.new.call(self, :user, nil)
    token
  end
  # == Class Methods ========================================================
  def send_user_welcome_mail
    UserMailer.with(user: self).welcome_email.deliver_now
  end
end
