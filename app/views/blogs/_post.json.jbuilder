json.extract! post, :id, :member, :title, :slug, :image, :excerpt, :content, :status, :visibility, :password, :allow_comments, :archived, :subscription, :created_at, :updated_at
json.url post_url(post, format: :json)
