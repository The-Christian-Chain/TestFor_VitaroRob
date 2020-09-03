class Category < BlogRecord
	has_many :category_maps
	has_many :posts, :through => :category_maps

	extend FriendlyId
  		friendly_id :name, use: :slugged
end