class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    visitors_path
  end

  def current_location
    @_current_location ||= current_user.locations.find(session_location_id)
  end

  def change_location_session(location_id)
    session[:location_id] = location_id
  end

  private
    def session_location_id
      session[:location_id] ||= current_user.locations.first.id
    end
end
