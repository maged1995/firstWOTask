class TagsController < ApplicationController

  def create
    @tag = Tag.new(name: params[:name])
    if @tag.save
      render json: {'tag' => 'Created'}
    else
      render json: {'tag' => 'not Created'}
    end
  end

end
