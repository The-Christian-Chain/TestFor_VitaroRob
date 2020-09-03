class Member < ApplicationRecord	
	has_one :profile, dependent: :destroy
		accepts_nested_attributes_for :profile
		validates_uniqueness_of :email				
	has_many :posts
	has_many :comments


  	devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, 
           :validatable  
end