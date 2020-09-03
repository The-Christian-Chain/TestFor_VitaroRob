class PostsController < ApplicationController
    include PostConcern
  
    # From PostConcern
    before_action :check_posts_redirect,  only: [:index]
  
    before_action :set_post,              only: [:show, :edit, :update, :destroy]
    before_action :is_author_of_post,     only: [:show, :edit]
    before_action :can_comment,           only: [:show]
  
    def index
    end
  
    def show
      @comment = Comment.new
    end
  
    def new
      if @can_create_post
        @post = Post.new
        @sections = Section.where(active: true).select(:id, :name, :slug, :order).sort_by{|o| o[:order]}
        @categories = Category.where(active: true).select(:id, :name, :slug).sort_by{|n| n[:name]}
        @tags = Tag.where(active: true).select(:id, :name, :slug).sort_by{|n| n[:name]}
      else
        redirect_to blog_path
        flash.now[:danger] = 'You are not authorized to create a post.'
      end
    end
  
    def edit
      @tags = Tag.where(active: true).select(:id, :name, :slug).sort_by{|id| id[:id]}
      @categories = Category.where(active: true).select(:id, :name, :slug).sort_by{|id| id[:id]}
      @sections = Section.where(active: true).select(:id, :name, :slug, :order).sort_by{|o| o[:order]}
    end
  
    def create
      @post = Post.new(post_params)
  
      @post.member_id = @member.id
      
      respond_to do |format|
        if @post.save
          format.html { redirect_to @post, notice: 'Post was successfully created.' }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to @post, notice: 'Post was successfully updated.' }
          format.json { render :show, status: :ok, location: @post }
          format.js   { render :show, status: :ok, location: @post}
        else
          format.html { render :edit }
          format.json { render json: @post.errors, status: :unprocessable_entity }
          format.js   { render edit: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def toggle_delete
      @post = Post.find_by_slug(params['id'])
      if @post.deleted_at.nil?
        if @can_delete_post == false
          respond_to do |format|
            format.html { render :edit }
            format.json { render json: @post.errors, status: :unprocessable_entity }
            format.js   { render edit: @post.errors, status: :unprocessable_entity }
          end
        else
          respond_to do |format|
            if @post.update(hidden: true, deleted_at: DateTime.now)
              format.html { redirect_to blog_url, notice: 'Post was successfully deleted.' }
              format.json { head :no_content }
            else
              format.html { render :edit }
              format.json { render json: @post.errors, status: :unprocessable_entity }
              format.js   { render edit: @post.errors, status: :unprocessable_entity }
            end
          end
        end
      elsif @post.deleted_at.nil? == false
        if @can_recover_post == false
          respond_to do |format|
            format.html { render :edit }
            format.json { render json: @post.errors, status: :unprocessable_entity }
            format.js   { render edit: @post.errors, status: :unprocessable_entity }
          end
        else
          respond_to do |format|
            if @post.update(hidden: false, deleted_at: nil)
              format.html { redirect_to @post, notice: 'Post was successfully recovered.' }
              format.json { render :show, status: :ok, location: @post }
              format.js   { render :show, status: :ok, location: @post}
            else
              format.html { render :edit }
              format.json { render json: @post.errors, status: :unprocessable_entity }
              format.js   { render edit: @post.errors, status: :unprocessable_entity }
            end
          end
        end
      else
        respond_to do |format|
          format.html { redirect_to blog_url, notice: 'Unable to process your request.' }
          format.json { head :no_content }
        end
      end
    end
  
    def destroy
      
      if @can_destroy_post == false
        respond_to do |format|
          format.html { render :edit }
          format.json { render json: @post.errors, status: :unprocessable_entity }
          format.js   { render edit: @post.errors, status: :unprocessable_entity }
        end
      else
        respond_to do |format|
          if @post.destroy  
            format.html { redirect_to blog_url, notice: 'Post was successfully destroyed.' }
            format.json { head :no_content }
          else
            format.html { render :edit }
            format.json { render json: @post.errors, status: :unprocessable_entity }
            format.js   { render edit: @post.errors, status: :unprocessable_entity }
          end
        end
      end
    end
  end