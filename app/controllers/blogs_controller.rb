class BlogsController < ApplicationController
	include BlogConcern
	include PostConcern

	# From BlogConcern
	before_action :set_blog, 		only: [:show, :edit, :update]
	before_action :can_edit_blog,	only: [:edit]
	
	# From PostConcern
	before_action :can_create_post, only: [:index]

	def index
		@search = ""
	    # --> Won't work as slugs aren't just downcase of the name. Need to figure out a better way to refactor this. 
	    #  Plus there is a lot of duplicate code here and in the blog index
		if params[:section]
		 	@posts = Post.in_section(params[:section]).where(status: "published").includes(member: [:profile]).reverse
		elsif params[:category]
		  	@posts = Post.categorized_as(params[:category]).where(status: "published").includes(member: [:profile]).reverse
		elsif params[:tag]
		  	@posts = Post.tagged_with(params[:tag]).where(status: "published").includes(member: [:profile]).reverse 
		 elsif params[:author]
		  	@posts = Post.where(status: "published", member_id: Profile.where(user_name: params[:author]).pluck(:member_id)).includes(member: [:profile]).reverse 
		else
			@posts = Post.where(status: "published").includes(member: [:profile]).reverse
		end

	    @sections = Section.where(id: SectionBlogMap.all.select(:section_id)).select(:id, :name, :slug, :order).sort_by{|o| o[:order]}
	    @categories = Category.where(id: CategoryMap.all.select(:category_id)).select(:id, :name, :slug).sort_by{|n| n[:name]}
	      # @category_maps = CategoryMap.all.pluck(:category_id).sort
	    @tags = Tag.where(id: TagMap.all.select(:tag_id)).select(:id, :name, :slug).sort_by{|n| n[:name]}
	      # @tag_maps = TagMap.all.pluck(:tag_id).sort
	end

	def show
	end

	def list
	    @posts = Post.where(status: "published").includes(member: [:profile]).reverse
	end

	def edit
		unless @can_edit
	      redirect_to blog_path
	      flash.now[:danger] = 'You are not authorized to view that page.'
	    end
	end

	def update
      if @blog.update(blog_params)
        redirect_to blog_settings_path, notice: 'Blog was successfully updated.'
      else
        render :edit
      end
 	end

 	def search
 		@criteria = params[:criteria].strip
 		@criteria_downcase = @criteria.downcase
 		@categories = Category.where("lower(name) like ?", "%" + @criteria_downcase + "%").to_a
 		@tags = Tag.where("lower(name) like ?", "%" + @criteria_downcase + "%").to_a
 		# @posts = Post.where(status: "published").where("lower(title) like ?", "%" + @criteria_downcase + "%").to_a
 		@posts= Post.where(status: "published").where("lower(title) like '%" + @criteria_downcase + "%' OR lower(content) like '%" + @criteria_downcase + "%' OR lower(excerpt) like '%" + @criteria_downcase + "%'").to_a
 	end
end