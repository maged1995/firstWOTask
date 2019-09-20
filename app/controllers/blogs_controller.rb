class BlogsController < ApplicationController

  def create
    puts "here"
    puts session[:author_id]
    @blog = @current_author.blogs.new(name: params[:name], blog: params[:blog])
    if @blog.save
      render json: {'blog' => 'Created'}
    else
      render json: {'blog' => 'not Created'}
    end
  end

  def destroy
    @blog = @current_author.blogs.find(params[:id])
    @blog.destroy
    render json: {'blog' => 'Removed'}
  end

  def update

    if blog_params
        @res = {}
        @blog = @current_author.blogs.find(params[:id])
        if params[:new_tag]
          unless @blog.tags.where(:id => params[:new_tag]).any?
            @tag = Tag.find(params[:new_tag])
            if @blog.tags << @tag
              @res['new tag'] = 'added'
            end
          end
        end
        if params[:remove_tag]
          if @blog.tags.where(:id => params[:remove_tag]).any?
            @tag = Tag.find(params[:remove_tag])
            if @blog.tags.delete(@tag)
              @res['remove tag'] = 'success'
            end
          end
        end
        if @blog.update_attributes(blog_params)
          @res['blog'] ='Successful update'
          render json: @res
        else
          @res['blog'] ='update failure'
          render json: @res
        end
    end

  end

  private
    def blog_params
      params.permit(:name, :blog)
    end
end
