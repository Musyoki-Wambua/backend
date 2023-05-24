class SessionsController < ApplicationController
    skip_before_action :authorize, only: :create
    skip_before_action :verify_authenticity_token, only: [:create]
  
    def login
      user = User.find_by(email: params[:email])
  
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        render json: user, status: :ok
      else
        render json: { errors: "Invalid username or password" }, status: :unauthorized
      end
    end
  
    def destroy
      session.delete(:user_id)
      head :no_content
    end
  end
  