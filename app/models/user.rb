class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  # TODO: add some validate
  has_many :subscriptions
	has_many :installations, through: :subscriptions

	scope :actived, -> { where (isactive == true) }
	# scope :not_spammed, -> { where('email_sent_at > :last_hours', 
	# 											 	 :last_hours => Time.now - 12.hours) }
end
