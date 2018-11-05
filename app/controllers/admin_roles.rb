class AdminRolesController < ApplicationController
  def index
    @users = user.user_roles.where(role_id: 9)
  end
end