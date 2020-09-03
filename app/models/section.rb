class Section< BlogRecord
	has_many :section_blog_maps
	has_many :blogs, :through => :section_blog_maps

	has_many :section_post_maps
	has_many :posts, :through => :section_post_maps

	extend FriendlyId
  		friendly_id :name, use: :slugged
end