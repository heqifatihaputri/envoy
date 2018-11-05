class AdminRolesController < ApplicationController
  def index
    @user_roles = UserRole.all
  end
end