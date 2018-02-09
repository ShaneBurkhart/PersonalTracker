class User < ActiveRecord::Base
  devise :trackable
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :daily_trackers

  validates :email, :first_name, :last_name, :image_url, presence: true

  delegate :can?, :cannot?, :to => :ability

  def ability
    @ability ||= Ability.new(self)
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def self.from_omniauth(auth_hash)
    info = auth_hash['info']
    email = info['email']

    user = User.where(email: email).first

    unless user
      user = User.create(
        email: email,
        first_name: info['first_name'],
        last_name: info['last_name'],
        image_url: info['image']
      )
    end

    user
  end
end
