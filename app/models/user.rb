class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # has_many :bunches, dependent: :destroy
  has_many :bunches, through: :subscriptions

  has_many :subscriptions, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_welcome_email

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

end
