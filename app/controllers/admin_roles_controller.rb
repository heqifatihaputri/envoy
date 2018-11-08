class AdminRolesController < ApplicationController
  def index
    @user_roles = UsersRole.all.order("location_id ASC")
  end
end