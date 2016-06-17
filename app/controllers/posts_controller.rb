class PostsController < ApplicationController

  before_action :set_post, :only => [:show, :edit, :update, :destroy]


  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @page_title = @post.title
  end

  def create
    @post = Post.new( post_params )
    if @post.save 
      flash[:notice] = "New Post Added"
      redirect_to posts_path 
    else
      render :action => :new
    end
  end

  def edit
    @page_title = @post.title
  end

  def update  
   if @post.update(post_params)
      flash[:notice] = "Information Updated "
      redirect_to post_path(@post)
    else
      render :action => :edit
    end 
    
  end

  def destroy
    @post.delete
    flash[:alert] = "Post Deleted"
    redirect_to posts_path
  end  









private
    
  def post_params
      params.require(:post).permit(:title, :description)
  end

  def set_post
    @post = Post.find(params[:id])
  end






end
