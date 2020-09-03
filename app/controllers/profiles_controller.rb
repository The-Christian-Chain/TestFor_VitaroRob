class ProfilesController < ApplicationController
  before_action :authenticate_member!, only: [:edit, :update, :destroy, :user_name, :create_profile]
  before_action :active_member_redirect, except: [:index, :status]
  before_action :authenticate_admin, only: [:index, :status]
  before_action :show_page, only: [:show, :edit]

  def index
    @profiles = Profile.all.sort_by{|s| s[:created_at]}
  end

  def show
    @profile = Profile.find_by(user_name: params[:user_name])

    if @profile.nil?
      flash.now[:warning] = 'Member profile not found.' 
      redirect_to root_path
      return
    else
      @member = Member.find(@profile.member_id)
    end

    if owner_of_profile(@profile)
      @user = 'Owner'
    else
      if @profile.published == false && !@current_admin
        flash.now[:warning] = 'Member profile not found.' 
        redirect_to root_path
      else
        @user = 'Visitor'
        unless current_admin
          unless @show_page == 'main'
            redirect_to member_profile_path(user_name: params[:user_name])
          end
        end
      end
    end
  end

  def new
    if @profile_present
      flash.now[:warning] = 'Sorry, you can only have one profile. Do you want to edit your current profile?'
      redirect_to member_profile_path(current_member.profile.user_name)
    else
      @profile = Profile.new
    end
  end

  def edit
    @profile = Profile.find_by(user_name: params[:user_name])
    
    unless owner_of_profile(@profile)
      flash.now[:warning] = 'Sorry, but you are not allowed to edit that profile.'
      redirect_to members_list_path
    end
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      unless params[:profile][:phone].nil?
        @new_number = sanitize_phone(params[:profile][:phone])
        @profile.update(phone: @new_number)
      end
      flash.now[:success] = 'Profile was successfully created.'
      redirect_to member_profile_path(current_member.profile.user_name)
    else
      render :user_name 
    end
  end

  def update
    ########## Sanitize User_name ##########
    @temp_user_name = params[:profile][:user_name]

    unless @temp_user_name.nil?
      @temp_user_name = sanitize_user_name(@temp_user_name)

      if @temp_user_name == 'Too Long'
        flash.now[:warning] = 'Your user_name needs to be below 20 characters in length.'
        @redirect = true
      end

      if user_name_blacklist(@temp_user_name)
        flash.now[:warning] = 'Your user_name includes one of the terms that are not allowed. Please try again.'
        @redirect = true
      end

      if @redirect
        if session[:profile_setup]
          redirect_to create_profile_path
        else
          redirect_to create_user_name_path
        end
        return
      end

      params[:profile][:user_name] = @temp_user_name
    end

    ########## Sanitize Phone Number ##########
    @new_number = params[:profile][:phone]
    unless @new_number.nil? || @new_number == ''
      @new_number = sanitize_phone(@new_number)
      if @new_number == 'Invalid Number'
        flash.now[:warning] = 'The phone number that you entered is invalid. Please check the number and try again. Please only include the 10-digits of your number. Thank you.'
        redirect_to edit_profile_page_path(user_name: current_member.profile.user_name)

        return
      else
        params[:profile][:phone] = @new_number
      end
    end

    ########## Proceed forward with Update ##########
    if @profile.update(profile_params)
      if session[:create_user_name] == true && @profile.user_name_created == true
        session.delete(:create_user_name)
      end

      if @profile.deactivated == true
        @profile.update!(published: false)
      end

      if session[:profile_setup] == true
        redirect_to create_profile_path
      else
        flash.now[:success] = 'Profile was successfully updated.'
        redirect_to member_profile_path(@profile.user_name)
      end
    else
      if user_name_created
        flash.now[:warning] = 'An error occured. Please check your inputs and try again.'
        redirect_to edit_profile_page_path(user_name: @profile.user_name)
      else
        if Profile.exists?(user_name: params[:profile][:user_name])
          @alert = 'That user_name is already taken. Please try a different name.'
        else
          @alert = 'Your user_name is invalid. Please check the requirements and try again.'
        end
        flash.now[:warning] = @alert
        render :user_name
      end
    end
  end

  def destroy
    @profile.destroy
    flash.now[:danger] = 'Profile was successfully deleted.'
    redirect_to root_path
  end

  def user_name
    if user_name_created
      redirect_to member_profile_path(current_member.profile.user_name)
    else
      @member = current_member
      session[:create_user_name] = true
    end
  end  

  def create_profile
    @member = current_member
    @profile = Profile.find_by(member_id: @member.id)
    session[:profile_setup] = true

    if @profile.reg_step == 1 || @profile.reg_step == 2
      if user_name_created
        @registration_step = 'personal'
      else
        @registration_step = 'user_name'
      end
    elsif @profile.reg_step == 3
      @registration_step = 'personal'
    elsif @profile.reg_step == 4
      @registration_step = 'social'
    else @profile.reg_step == 5
      @registration_step = 'complete'
      session.delete(:profile_setup)
    end
  end

  def cancel_walkthrough
    session[:profile_setup] = false
    redirect_to member_profile_path(user_name: current_member.profile.user_name)
  end

  def status
    if params[:status].nil?
      flash.now[:warning] = 'You need to provide a status update.'
      redirect_to members_list_path
    else
      if params[:status] == 'activate'
        @status = false
        @alert_type = 'success'
        @status_notice = 'activated'
      else
        @status = true
        @alert_type = 'danger'
        @status_notice = 'deactivated'
      end

      @profile_to_update = Profile.find(params[:id])

      @profile_to_update.update(deactivated: @status)

      flash.now[@alert_type] = 'The profile for ' + @profile_to_update.user_name + ' has been ' + @status_notice + '.'
      redirect_to members_list_path
    end
  end

  #####################
  ##     Private     ##
  #####################

  private
    # Use callbacks to share common setup or constraints between actions.
    def show_page
      @show_page = params[:page]
    
      if @show_page.nil?
        @show_page = 'main'
      end
    end

    def owner_of_profile(profile)
      
      if current_member # Member is signed in
        if current_member.id == profile.member_id # Profile is matched to the signed in Member
          @owner_of_profile = true
        else # Profile is not matched to the signed in Member
          @owner_of_profile = false
        end
      else # Visitor is not signed in
        @owner_of_profile = false
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:member_id, :provider, :universal_id, :first_name, :middle_name, :last_name, :user_name, :gender, :avatar, :avatar_main, :avatar_thumb, :avatar_nav, :birthday, :phone, :address1, :address2, :city, :state, :zip_code, :long, :lat, :tcc_profile, :facebook, :twitter, :instagram, :pinterest, :linkedin, :motto, :reg_step, :security, :user_name_created, :published, :deactivated, :tcc_created, :tcc_updated)
    end
end