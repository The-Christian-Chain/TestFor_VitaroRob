class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Include Concern Statements
    include MemberConcern
    include AdminConcern
    include ProfileConcern
    include SettingsConcern
# End of Concern Statements

end
