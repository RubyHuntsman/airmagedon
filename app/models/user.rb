class User < ApplicationRecord
  # Include default devise modules. Others available are:
  validates :login, presence: true, uniqueness: true

  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # TODO: add some validate
  has_many :subscriptions, dependent: :destroy
	has_many :installations, through: :subscriptions

	scope :activated, -> { where(isactive: true) }
	scope :not_spammed, -> { where('email_sent_at < :last_hours OR email_sent_at is NULL',
												 	 last_hours: Time.now - 8.hours) }

end
