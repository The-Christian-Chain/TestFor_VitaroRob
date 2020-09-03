class SettingsController < ApplicationController
  before_action :authenticate_admin

  after_action :set_setting
  
  def show
  end

  def edit
  end

  def update
    if @setting.update(setting_params)
      redirect_to setting_path, notice: 'Setting was successfully updated.'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setting
      @setting = Setting.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def setting_params
      params.require(:setting).permit(:author, :ministry_name, :site_name, :keywords, :description, :motto, :launch_date, :primary_color, :secondary_color, :logo, :favicon, :apple_touch, :apple_touch_152, :apple_touch_167, :apple_touch_180, :apple_touch_startup, :website, :email, :phone, :address1, :address2, :city, :state, :zip_code, :google_analytics, :facebook, :twitter, :instagram, :pinterest, :linkedin)
    end
end
