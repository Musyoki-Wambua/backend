class ApplicationController < ActionController::Base
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    # before_action :authorize        
    protect_from_forgery with: :null_session


    private 

    def current_user
      @current_user =  User.find_by_id(session[:user_id])
    end


    def authorize
        @current_user = User.find_by_id(session[:user_id])
        render json: { errors: ["Not Authorized"] }, status: :unauthorized unless @current_user
    end



      def user_logged_in?
        current_user.present?
      end
      

    def render_unprocessable_entity(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end
