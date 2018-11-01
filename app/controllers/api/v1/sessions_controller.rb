class Api::V1::SessionsController < Api::V1::BaseController
  def create
    if @user
      render(
        jsonapi: @user,
        serializer: Api::V1::SessionSerializer,
        status: 201,
        include: [:user],
        scope: @user
      )
    else
      return api_error(status: 401, errors: 'Wrong password or username')
    end
  end

  private
    def create_params
      normalized_params.permit(:email, :password)
    end

    def load_resource
      @user = User.find_by(
        email: create_params[:email]
      )&.authenticate(create_params[:password])
    end

    def normalized_params
      ActionController::Parameters.new(
         ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      )
    end
end