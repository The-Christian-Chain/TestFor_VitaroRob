module BlogsHelper
	def count_search_criteria(text, search_criteria)
		text.downcase.scan(/(?=#{search_criteria})/).count
	end
end