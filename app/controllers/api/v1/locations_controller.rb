class Api::V1::LocationsController < Api::V1::BaseController
  before_action :set_location, only: [:show, :update, :destroy]

  def index
    @locations = Location.all

    render json: Api::V1::LocationSerializer.new(@locations).serialized_json, status: :ok 
  end

  def show
    @location = Location.find(params[:id])

    render json: Api::V1::LocationSerializer.new(@location).serialized_json, status: :ok 
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      render json: Api::V1::LocationSerializer.new(@location).serialized_json, status: :ok 
    else
      render_error(@location, :unprocessable_entity)
    end
  end

  def update
    if @location.update_attributes(location_params)
      render json: Api::V1::LocationSerializer.new(@location).serialized_json, status: :ok 
    else
      render_error(@location, :unprocessable_entity)
    end
  end

  def destroy
    @location.destroy
    head 204
  end

  def signed_out
   @location.sign_out
   render json: Api::V1::LocationSerializer.new(@location).serialized_json, status: :ok 
  end

  private

  def set_location
    begin
      @location = Location.find params[:id]
    rescue ActiveRecord::RecordNotFound
      @location = Location.new
      @location.errors.add(:id, "Wrong ID provided")
      render_error(@location, 404) and return
    end
  end

  def location_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end