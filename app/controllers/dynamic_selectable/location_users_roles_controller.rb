module DynamicSelectable
  class LocationUsersRolesController < SelectController
    def index
      users_roles = UsersRole.where(location_id: params[:location_id]).select('id, user_id').order('user_id asc')
      render json: users_roles
    end
  end
end
