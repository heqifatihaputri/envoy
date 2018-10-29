class InvitesController < ApplicationController
  before_action :set_invite, only: [:show, :edit, :update, :destroy, :signed_in]
  before_action :authenticate_user!

  # GET /invites
  # GET /invites.json
  def index
    @invites = if params[:search]
      Invite.search_by_full_name(params[:search])
    elsif params[:date]
      Invite.search_by_date(params[:date])
    else
      Invite.where(arrival: Date.today.all_day)
    end
  end

  # GET /invites/1
  # GET /invites/1.json
  def show
  end

  # GET /invites/new
  def new
    @invite = Invite.new
  end

  # GET /invites/1/edit
  def edit
  end

  # POST /invites
  # POST /invites.json
  def create
    @invite = Invite.new(invite_params)

    respond_to do |format|
      if @invite.save
        format.html { redirect_to @invite, notice: 'Invite was successfully created.' }
        format.json { render :show, status: :created, location: @invite }
      else
        format.html { render :new }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invites/1
  # PATCH/PUT /invites/1.json
  def update
    respond_to do |format|
      if @invite.update(invite_params)
        format.html { redirect_to @invite, notice: 'Invite was successfully updated.' }
        format.json { render :show, status: :ok, location: @invite }
      else
        format.html { render :edit }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invites/1
  # DELETE /invites/1.json
  def destroy
    @invite.destroy
    respond_to do |format|
      format.html { redirect_to invites_url, notice: 'Invite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def signed_in
   @invite.sign_in
   redirect_to invites_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invite
      id = params[:id].present? ? (params[:id]) : (params[:invite_id])
      @invite = Invite.find(id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invite_params
      params.require(:invite).permit(:location_id, :arrival, :full_name, :email_visitor, :host, :private_notes, :sign_in_time)
    end
end
