class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
  
  def after_sign_in_path_for(resource)
    visitors_path
  end

  def after_sign_up_path_for(resource)
    visitors_path
  end

  def current_location
    @_current_location ||= current_user.locations.find(session_location_id)
  end

  def change_location_session(location_id)
    session[:location_id] = location_id
  end

  def remove_location_session
    session.delete(:location_id)
  end

  private
    def session_location_id
      session[:location_id] ||= current_user.locations.first.id
    end
end
