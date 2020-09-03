module BlogConcern
    extend ActiveSupport::Concern
  
    included do
      before_action :set_blog_security
    end
  
      # Use callbacks to share common setup or constraints between actions.
    def set_blog
        @blog = Blog.first
    end
  
      # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:name, :description, :has_sections, :has_subscription, :visible)
    end
  
    def set_blog_security
      if @profile.nil?
        @member_security = "unknown"
      else
        @member_security = @profile.security
      end
    end
  
    def can_edit_blog
        @can_edit = false
  
          if 	@member_security == "manager" || @current_admin
              @can_edit = true
          end
    end
  
  end