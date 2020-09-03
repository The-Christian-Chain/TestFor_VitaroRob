module PostConcern
    extend ActiveSupport::Concern
  
    included do
      before_action :set_security
    end
  
    def set_security
      if @profile.nil?
        @member_security = "unknown"
      else
        @member_security = @profile.security
      end
    end
  
    def set_post
      @post = Post.includes(:comments).friendly.find(params[:id])
      @members = Profile.where(member_id: @post.comments.pluck(:member_id)).select(:id, :user_name)
    end
  
    def post_params
      params.require(:post).permit(:member_id, 
                                    :title, :slug, :location, :content, :image, 
                                    :status, :visibility, :password, :allow_comments, :archived, :subscription, 
                                    :all_sections, :sections_only, :all_categories, :categories_only, :all_tags, :tags_only, :toggle)
    end
  
    def check_posts_redirect
      if  request.original_fullpath == "/posts" || 
          request.original_fullpath == "/posts/" || 
          request.original_fullpath == "/post/" || 
          request.original_fullpath == "/post"
  
        redirect_to blog_path
      end
    end
  
    def is_author_of_post
      @is_author_of_post = false
  
      if  @member_security == "unknown"
          @is_author_of_post = false
        return
      end
  
      if  @post.member_id == @member.id
          @is_author_of_post = true
        return
      end
    end
  
    def can_comment
      @can_comment = false
  
      if @active_member
        @can_comment = true
      end
    end
  
    def can_read_post
            #Need to make a subscribers table
    end
  end