class Comment < BlogRecord
	belongs_to :post
	belongs_to :member

	validates :text, presence: true, length: { minimum: 2, maximimum: 1000}

	after_create_commit { CommentBroadcastJob.perform_later(self) }
end