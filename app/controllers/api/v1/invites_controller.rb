class Api::V1::InvitesController < Api::V1::BaseController
  before_action :set_invite, only: [:show, :update, :destroy]

  def index
    @invites = Invite.all

    render json: Api::V1::InviteSerializer.new(@invites).serialized_json, status: :ok 
  end

  def show
    @invite = Invite.find(params[:id])

    render json: Api::V1::InviteSerializer.new(@invite).serialized_json, status: :ok 
  end

  def create
    @invite = Invite.new(invite_params)
    @invite.save!
    render json: @invite
  rescue StandardError => e
    render_error(e, :unprocessable_entity)
  end

  def update
    if @invite.update_attributes(invite_params)
      render json: Api::V1::InviteSerializer.new(@invite).serialized_json, status: :ok 
    else
      render_error(@invite, :unprocessable_entity)
    end
  end

  def destroy
    @invite.destroy
    head 204
  end

  def signed_out
   @invite.sign_out
   render json: Api::V1::InviteSerializer.new(@invite).serialized_json, status: :ok 
  end

  private

  def set_invite
    begin
      @invite = Invite.find params[:id]
    rescue ActiveRecord::RecordNotFound
      @invite = Invite.new
      @invite.errors.add(:id, "Wrong ID provided")
      render_error(@invite, 404) and return
    end
  end

  def invite_params
    params.require(:invite).permit(:location_id, :arrival, :full_name, :email_visitor, :private_notes, :sign_in_time, :user_id)
  end
end