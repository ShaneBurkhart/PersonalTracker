class User < ActiveRecord::Base
  devise :registerable, :database_authenticatable, :trackable, :validatable, :recoverable

  validates :first_name, :last_name, presence: true

  delegate :can?, :cannot?, :to => :ability

  def ability
    @ability ||= Ability.new(self)
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
