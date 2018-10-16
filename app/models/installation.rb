class Installation < ApplicationRecord
	has_many :measurements
	has_many :subscriptions
	has_many :users, through: :subscriptions
end
