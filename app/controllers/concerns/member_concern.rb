module MemberConcern
  extend ActiveSupport::Concern

  included do
    before_action :active_member
    before_action :member_display_name
  end
  
  def active_member
    @member = current_member

    if @member.nil?
      ### Don't know if this area is needed.
      # flash.now[:warning] = 'You need to login first.'
      # redirect_to new_member_session_path
    else
      if profile_present
        @member_status = @profile.deactivated

        if @member_status == true # Member's profile has been deactivated
          active_member = false
          @active_member = false
        else # Member's profile is active
          active_member = true
          @active_member = true
        end
      end
    end
  end

  def active_member_redirect
    if active_member == false
      flash.now[:danger] = 'Your profile has been deactivated. Please contact member support for assistance.'
      redirect_to root_path 
    end
  end

  def active_member_alert
    if active_member == false
      flash.now[:danger] = 'Your profile has been deactivated. Please contact member support for assistance.'
    end
  end

  def profile_present
    @profile = @member.profile

    if @profile.nil?
      @profile_present = false
      profile_present = false
    else
      @profile_present = true
      profile_present = true
    end
  end

  def member_display_name
    @member_display_name = "Guest"

    if @profile_present
      if @profile.first_name.nil?
        @member_display_name = @member.email
      else
        @member_display_name = @profile.first_name
      end
    end
  end

end