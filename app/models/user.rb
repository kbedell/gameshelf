class User < ActiveRecord::Base
  has_many :usersgames
  has_many :games, through: :usersgames

  validates :first_name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, omniauth_providers: [:amazon]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.name
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.amazon_data'] && session['devise.amazon_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end
end
