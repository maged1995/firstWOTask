class SessionsController < ApplicationController
  skip_before_action :authorize_request, only: [:new, :create]

  def new
  	# Login Page - new.html.erb
  end

  def create
  	@author = Author.find_by(username: params[:username])
  	password = params[:password]
    if @author && @author.authenticate(password)
      token = JsonWebToken.encode(user_id: @author.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     username: @author.username }, status: :ok
      #puts @author.id
      #puts session[:author_id]
      #render json: {"login" => "Welcome #{@author.name}"}
    else
      render json: {"login" => "Failure"}
    end
  end

  def destroy
    reset_session # wipe out session and everything in it
    render json: {"Logout" => "Success"}
  end

  protected
    def ensure_login
      redirect_to login_path unless session[:author_id]
    end

    def logged_in?
      session[:author_id]
    end

    def current_user
      @current_user ||= Author.find(session[:author_id])
    end
end
