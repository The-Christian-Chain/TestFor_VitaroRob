class CommentsController < BlogsController
    def create
        @comment = current_member.comments.build(comment_params)
    end

    private

    def comment_params
        params.require(:comment).permit(:text, :comment_id)
    end
end