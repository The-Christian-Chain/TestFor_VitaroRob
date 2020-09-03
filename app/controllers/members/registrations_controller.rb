class Members::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    if params[:return_to]
      session[:return_to_client] = params[:return_to]
    end
    super
  end

  # POST /resource
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        @profile = Profile.create!(
                    :tcc_created => current_member.created_at, 
                    :tcc_updated => current_member.created_at,
                    :member_id => current_member.id, 
                    :universal_id => current_member.id, 
                    :user_name => 'Member' + current_member.id.to_s, 
                    :reg_step => '2',
                    :first_name => params[:member][:profile][:first_name], 
                    :middle_name => params[:member][:profile][:middle_name], 
                    :last_name => params[:member][:profile][:last_name], 
                  )
        if session[:return_to]
          return_to_link = session[:return_to]
          session[:return_to] = nil
          
          redirect_to return_to_link
        else
          respond_with resource, location: after_sign_up_path_for(resource)
        end
        
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  # GET /resource/edit
  def edit
    if current_member.profile.user_name == params[:user_name]
      @show_page = params[:show_page]
      
      super
    else
      flash.now[:warning] = 'Sorry, but you are not allowed to edit that profile.'
      redirect_to root_path
    end
  end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  def destroy
    current_member.profile.update!(deactivated: true, published: false)
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)  
    set_flash_message :notice, :destroyed if is_flashing_format?  
    yield resource if block_given?  
    respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute], profile_attributes: [:member_id, :first_name, :middle_name, :last_name, :reg_step])
  end

  def after_update_path_for(resource)
    member_profile_page_path(user_name: current_member.profile.user_name, page: 'account')
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    # super(resource)
    if session[:member_return_to].nil? || session[:member_return_to] == '' || session[:member_return_to] == ' '
      create_profile_path
    else
      session[:member_return_to]
    end
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end