class AdminRolesController < ApplicationController
  load_resource :admin_roles
  def index
    @user_roles = UsersRole.all.order("location_id ASC")
  end
end