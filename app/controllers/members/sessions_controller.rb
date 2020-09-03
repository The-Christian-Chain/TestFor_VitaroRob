  class Members::SessionsController < Devise::SessionsController
    # before_action :configure_sign_in_params, only: [:create]

    # GET /resource/sign_in
    def new
      if params[:return_to]
        session[:return_to] = params[:return_to]
      end

      unless session[:return_to_client].nil?
        return_to = session[:return_to_client]
        @page_layout = 'client_login' 
        @client_login = true
        # @ministry_name = get_ministry_name(params[:return_to])
        # @ministry_name = get_ministry_name('samaritanbags.com')
      else
        @page_layout = 'main'
      end

      if params[:return_page]
        session[:member_return_to] = params[:return_page]
      end

      if params[:add_support]
        flash.now[:warning] = 'You need to login or register for an account first.'
        session[:add_support] = params[:add_support]
        @support = Support.find_by(url_friendly_title: params[:add_support])
        session[:member_return_to] = support_page_path(@support.url_friendly_title)
      end
      
      if params[:return_page] || params[:add_support]
        redirect_to new_member_session_path
        return
      end

      super
    end

    # POST /resource/sign_in
    def create
      self.resource = warden.authenticate!(auth_options)
      set_flash_message! :notice, :signed_in
      sign_in(resource_name, resource)
      yield resource if block_given?
      
      if session[:return_to]  
        return_to_link = session[:return_to]
        session[:return_to] = nil
        redirect_to return_to_link
      else
        respond_with resource, location: after_sign_in_path_for(resource)
      end
    end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end
  end