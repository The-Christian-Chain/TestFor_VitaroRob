class Profile < ApplicationRecord
	belongs_to :member

	validates_presence_of   :user_name,  :message => "Please verify that all required fields are filled out."
	validates :user_name, format: { with: /\A[a-zA-Z0-9]+\Z/ }
end