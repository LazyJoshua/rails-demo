class BlogsController < ApplicationController

  before_action :auth_user, except: [:index, :show]

  def index
    @blogs = Blog.page(params[:page] || 1).per_page(params[:per_page] || 5).order("id desc")
  end
  
  def new
    @blog = Blog.new
  end

  def create
    # @blog = Blog.new(blog_attrs)
    # @blog.user = current_user
    @blog = current_user.blogs.new(blog_attrs)
    if @blog.save
      params[:tags].split(',').each do |tag|
        one_tag = Tag.find_by(title: tag)
        one_tag = Tag.new(title: tag) unless one_tag
        @blog.tags << one_tag
      end

      flash[:notice] = "博客创建成功"
      redirect_to blogs_path
    else
      flash[:notice] = "博客创建失败"
      render action: :new
    end
  end

  def show
    @blog = Blog.find params[:id]
  end
  
  
  private 
  def blog_attrs
    params.require(:blog).permit(:title, :content)
  end
  
  

end
