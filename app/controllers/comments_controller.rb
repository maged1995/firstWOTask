class CommentsController < ApplicationController

  def show
    @blog = Blogs.find(params[:id])
    @comments = @blog.comments
    render json: {'comments' => @comments}


  def create
    @comment = @current_author.comments.new(comment: params[:comment])
    @blog = Blog.find(params[:blog_id])
    @blog.comments << @comment
    if @comment.save
      render json: {'comment' => 'Created'}
    else
      render json: {'comment' => 'not Created'}
    end
  end

  def update
    if comment_params
      @comment = @current_author.comments.find(params[:id])
      if @comment.update_attributes(comment_params)
        render json: {'comment' => 'updated'}
      else
        render json: {'comment' => 'update failure'}
      end
    end
  end

  def delete
    @comment = @current_author.comments.find(id: params[:comment_id])
    @comment.destroy
  end

  private
    def comment_params
      params.permit(:comment, :blog_id)
    end
end
