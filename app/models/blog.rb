class Blog < BlogRecord
	has_many :section_blog_maps, dependent: :destroy
	has_many :sections, :through => :section_blog_maps

	HAS_SECTIONS = [
		["Yes", true],
		["No", false]
	]

		SECTIONS = [
			["Yes", true],
			["No", false]
		]

	HAS_SUBSCRIPTIONS = [
		["Yes", true],
		["No", false]
	]

		SUBSCRIPTIONS = [
			["Yes", true],
			["No", false]
		]

	IS_VISIBLE = [
		["Yes", true],
		["No", false]
	]

		VISIBLE = [
			["Yes", true],
			["No", false]
		]
end