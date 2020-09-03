class BlogRecord < ActiveRecord::Base
  self.abstract_class = true

  connects_to database: { writing: :blog, reading: :blog_replica }
end