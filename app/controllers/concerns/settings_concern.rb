module SettingsConcern
  extend ActiveSupport::Concern

  included do
    before_action :load_settings
  end

  def load_settings
    @site_settings = Setting.first
  end
end