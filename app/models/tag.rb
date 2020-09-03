class Tag < BlogRecord
	has_many :tag_maps
	has_many :posts, :through => :tag_maps

	extend FriendlyId
  		friendly_id :name, use: :slugged

	# def self.counts
	#   self.select('"tags"."name", count("tag_maps"."tag_id") as count').joins(:tag_maps).group('"tags"."name"')
	# end
end