class UsersController < ApplicationController

    skip_before_action :verify_authenticity_token, only: [:create]
    skip_before_action :verify_authenticity_token

    def index 
        render json: User.all
    end

    def show 
        user = User.find_by(id: params[:id])
    end

    def create 
        user = User.create(user_params)
        if user.valid? 
            session[:user_id] = user.id 
            render json: user, status: :created 
        else 
            render json: { errors: user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def login 
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: :ok
          else
            render json: { error: "Invalid username or password" }, status: :unauthorized
        end
    end

    def destroy
        session.delete :user_id
        render json: { message: "Successfully logged out!" }, status: :ok
      end

    private 

    def user_params 
        params.permit(:email, :password)
    end
end
