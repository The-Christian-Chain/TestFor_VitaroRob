module AdminConcern
  extend ActiveSupport::Concern

  included do
    before_action :current_admin
  end

  def current_admin
    current_admin = false

    unless @profile.nil?
      if @profile.admin? || @profile.super_admin?
        current_admin = true
      end
    end
    
    if current_admin
      @current_admin = true
    else
      @current_admin = false
    end
  end

  def authenticate_admin
    if current_admin
      authenticate_admin = true
    else
      authenticate_admin = false
      flash.now[:danger] = 'You are not authorized to view that page.'
      redirect_to root_path
    end
  end
end