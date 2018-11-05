class Api::V1::VisitorsController < Api::V1::BaseController
  before_action :set_visitor, only: [:show, :update, :destroy]

  def index
    @visitors = Visitor.all

    render json: Api::V1::VisitorSerializer.new(@visitors).serialized_json, status: :ok 
  end

  def show
    @visitor = Visitor.find(params[:id])

    render json: Api::V1::VisitorSerializer.new(@visitor).serialized_json, status: :ok 
  end

  def create
    @visitor = Visitor.new(visitor_params)
    if @visitor.save
      # render json: Api::V1::VisitorSerializer.new(@visitor).serialized_json, status: :ok
      render json: @visitor
    else
      render_error(@visitor, :unprocessable_entity)
    end
  end

  def update
    if @visitor.update_attributes(visitor_params)
      render json: Api::V1::VisitorSerializer.new(@visitor).serialized_json, status: :ok 
    else
      render_error(@visitor, :unprocessable_entity)
    end
  end

  def destroy
    @visitor.destroy
    head 204
  end

  def signed_out
   @visitor.sign_out
   render json: Api::V1::VisitorSerializer.new(@visitor).serialized_json, status: :ok 
  end

  private

  def set_visitor
    begin
      @visitor = Visitor.find params[:id]
    rescue ActiveRecord::RecordNotFound
      @visitor = Visitor.new
      @visitor.errors.add(:id, "Wrong ID provided")
      render_error(@visitor, 404) and return
    end
  end

  def visitor_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end