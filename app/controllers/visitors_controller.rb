class VisitorsController < ApplicationController
  before_action :set_visitor, only: [:show, :edit, :update, :destroy, :signed_out]
  before_action :authenticate_user!

  # GET /visitors
  # GET /visitors.json
  def index
    @visitors = if params[:search]
      Visitor.search_by_full_name(params[:search])
    elsif params[:date]
      Visitor.search_by_date(params[:date])
    else
      Visitor.where(created_at: Date.today.all_day)
    end
  end

  # GET /visitors/1
  # GET /visitors/1.json
  def show
  end

  # GET /visitors/new
  def new
    @visitor = Visitor.new
  end

  # GET /visitors/1/edit
  def edit
  end

  # POST /visitors
  # POST /visitors.json
  def create
    @visitor = Visitor.new(visitor_params)

    respond_to do |format|
      if @visitor.save
        format.html { redirect_to @visitor, notice: 'Visitor was successfully created.' }
        format.json { render :show, status: :created, location: @visitor }
      else
        format.html { render :new }
        format.json { render json: @visitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visitors/1
  # PATCH/PUT /visitors/1.json
  def update
    respond_to do |format|
      if @visitor.update(visitor_params)
        format.html { redirect_to @visitor, notice: 'Visitor was successfully updated.' }
        format.json { render :show, status: :ok, location: @visitor }
      else
        format.html { render :edit }
        format.json { render json: @visitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visitors/1
  # DELETE /visitors/1.json
  def destroy
    @visitor.destroy
    respond_to do |format|
      format.html { redirect_to visitors_url, notice: 'Visitor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def signed_out
   @visitor.sign_out
   redirect_to visitors_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitor
      id = params[:id].present? ? (params[:id]) : (params[:visitor_id])
      @visitor = Visitor.find(id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visitor_params
      params.require(:visitor).permit(:your_full_name, :your_email_address, :purpose_of_visit, :photo_url, :host, :location_id, :private_notes, :sign_in_time, :sign_out_time, :signed_out)
    end
end
