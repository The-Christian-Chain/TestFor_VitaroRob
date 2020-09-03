class CategoryMap < BlogRecord
	belongs_to :post
	belongs_to :category
end