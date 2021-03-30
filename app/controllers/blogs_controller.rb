class BlogsController < ApplicationController
  def index
    @blogs=Blog.all
  end
  def new
    @blog=Blog.new
  end
  def create
    @blog=Blog.create(blog_params)
    if params [:back]
      render :new
    else
      if
        @blog.save
        redirect_to new_blog_path, notice: "Blog Created!"
      else
        render :new
      end
    end
  end
  def edit
      @blog=Blog.find(params[:id])
  end
  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "Blog Edited！"
    else
      render :edit
    end
  end
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
  end
  def confirm
    @blog=Blog.new(blog_params)
  end
  private
  def blog_params
    params.require(:blog).permit(:name,:content)
  end
end
