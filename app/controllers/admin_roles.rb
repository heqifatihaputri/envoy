class AdminRolesController < ApplicationController
  def index
    @users = user.users_roles.where(role_id: 9)
  end
end