class AdminRolesController < ApplicationController
  def index
    @user_roles = UsersRole.all
  end
end