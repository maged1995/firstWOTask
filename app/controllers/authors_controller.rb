class AuthorsController < ApplicationController
  skip_before_action :authorize_request, only:[:create]

  def create
    @author = Author.new(username: params[:username], password: params[:password], name: params[:name], email: params[:email])
    if @author.save
      render json: {'user' => 'Created'}
    else
      render json: {'user' => 'not Created'}
    end
  end
end
