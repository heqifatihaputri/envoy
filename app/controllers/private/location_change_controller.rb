class Private::LocationChangeController < ApplicationController
  before_action :authenticate_user!

  def edit
    location_id = params[:location_id]
    change_location_session(location_id)

    redirect_back(fallback_location: root_path)
  end
end
