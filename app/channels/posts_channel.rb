class PostsChannel < ApplicationCable::Channel
    def subscribed
        stream_from "post_#{params['post_id']}_channel"
    end

    def unsubscribed
    end

    def send_comment(data)
        current_member.comments.create!(text: data['comment'], post_id: data['post_id'])
    end
end