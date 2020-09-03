module PostsHelper
	def section_links(sections)
		unless sections.nil?
	  		sections.map { |s| link_to(s.name, section_path(s.slug)) }.join(", ").html_safe
	  	end
	end

	def category_links(categories)	
		unless categories.nil?
	  		categories.map { |c| link_to(c.name, category_path(c.slug)) }.join(", ").html_safe
	  	end
	end

	def tag_links(tags)
		unless tags.nil?
			tags.map { |t| link_to(t.name, tag_path(t.slug)) }.join(", ").html_safe
		end
	end
end