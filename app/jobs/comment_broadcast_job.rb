class CommentBroadcastJob < ApplicationJob
    queue_as :default
    
    def perform(comment)
        ActionCable.server.broadcast "posts_#{comment.post.id}_channel", comment: render_comment(comment)
    end

    private
    
    def render_comment(comment)
        @members = Profile.where(member_id: comment.post.comments.pluck(:member_id)).select(:id, :user_name)
        CommentsController.render partial: 'comments/comment', locals: { comment: comment, members: @members}
    end
end