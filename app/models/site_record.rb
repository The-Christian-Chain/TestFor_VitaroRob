class SiteRecord < ActiveRecord::Base
  self.abstract_class = true

  connects_to database: { writing: :site, reading: :site_replica }
end