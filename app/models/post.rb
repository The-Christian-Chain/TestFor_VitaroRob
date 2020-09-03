class Post < BlogRecord
	belongs_to :member
	has_many :comments, dependent: :destroy
	
	extend FriendlyId
  		friendly_id :title, use: :slugged

	has_many :section_post_maps, dependent: :destroy
	has_many :sections, :through => :section_post_maps

		def sections_only=(names)
		  self.sections = names.split(",").map do |name|
		      Section.where(name: name.strip).first_or_create!
		  end
		end

		def all_sections
			self.sections.select(:id, :name, :slug, :order).sort_by{|o| o[:order]}
		end

		def sections_only
			self.sections.sort_by{|n| n[:name]}.map(&:name).join(", ")
		end

	has_many :category_maps, dependent: :destroy
	has_many :categories, :through => :category_maps
	
		def categories_only=(names)
		  self.categories = names.split(",").map do |name|
		      Category.where(name: name.strip).first_or_create!
		  end
		end

		def all_categories
			self.categories.select(:id, :name, :slug).sort_by{|n| n[:name]}
		end

		def categories_only
			self.categories.sort_by{|n| n[:name]}.map(&:name).join(", ")
		end

	has_many :tag_maps, dependent: :destroy
	has_many :tags, :through => :tag_maps

		def tags_only=(names)
		  self.tags = names.split(",").map do |name|
		      Tag.where(name: name.strip).first_or_create!
		  end
		end

		def all_tags
			self.tags.select(:id, :name, :slug).sort_by{|n| n[:name]}
		end

		def tags_only
			self.tags.sort_by{|n| n[:name]}.map(&:name).join(", ")
		end

  	enum allow_comments: 	{ allow_comments: true, 		no_comments: false }
  		ALLOW_COMMENTS = [
			["Yes", "allow_comments"],
			["No", "no_comments"]
		]
	
	enum archived: 			{ archived: true, 				current: false }
		ARCHIVE = [
			["Yes", "archived"],
			["No", "current"]
		]
		ARCHIVED = [
			["Archived", "archived"],
			["Current", "current"]
		]

	enum subscription: 		{ subscription_only: true, 		free: false }
		SUBSCRIPTION = [
			["Yes", "subscription_only"],
			["No", "free"]
		]
		SUBSCRIPTIONED = [
			["Subscription Only", "subscription_only"],
			["Free", "free"]
		]

	enum status: 			{ draft: 1, 					under_review: 2, 			published: 3 }
		STATUS = [
			["Draft", "draft"],
			["Under Review", "under_review"],
			["Publish", "published"]
		]

		STATUSED = [
			["Draft", "draft"],
			["Under Review", "under_review"],
			["Published", "published"]
		]

	enum visibility: 		{ hidden: 1, 					visible: 2, 				members_only: 3 }
		VISIBILITY = [
			["Hide", "hidden"],
			["Visible", "visible"],
			["Members Only", "members_only"]
		]

		VISIBILITIED = [
			["Hidden", "hidden"],
			["Visible", "visible"],
			["Members Only", "members_only"]
		]

	def self.in_section(slug)
	  # Section.find_by_name!(slug).posts
	  Section.find_by_slug!(slug).posts
	end

	def self.categorized_as(slug)
	  Category.find_by_slug!(slug).posts
	end

	def self.tagged_with(slug)
	  Tag.find_by_slug!(slug).posts
	end
end