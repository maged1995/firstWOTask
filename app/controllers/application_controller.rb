class ApplicationController < ActionController::API
  before_action :authorize_request
  #helper_method :logged_in?, :current_user, :ensure_login


    def logged_in?
      session[:author_id]
    end

    def current_user
      @current_user ||= Author.find(session[:author_id])
    end

    def authorize_request
      header = request.headers['Authorization']
      header = header.split(' ').last if header
      begin
        @decoded = JsonWebToken.decode(header)
        @current_author = Author.find(@decoded[:user_id])
      rescue ActiveRecord::RecordNotFound => e
        render json: { errors: e.message }, status: :unauthorized
      rescue JWT::DecodeError => e
        render json: { errors: e.message }, status: :unauthorized
      end
    end
end
