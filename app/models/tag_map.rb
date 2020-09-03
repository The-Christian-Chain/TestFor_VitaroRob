class TagMap < BlogRecord
	belongs_to :tag
	belongs_to :post
end