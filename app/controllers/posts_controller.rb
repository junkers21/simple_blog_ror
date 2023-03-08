class PostsController < ApplicationController
  before_action :get_posts, except: [:new, :create]
  before_action :get_post, only: [:edit, :update, :show, :destroy]

  def index; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash.notice = "Your changes have been submitted"
      redirect_to root_url
    else
      flash.alert = "You must complete the form correctly"
      render "posts/new"
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      flash.notice = "Your changes have been submitted"
      redirect_to root_url
    else
      flash.alert = "You must complete the form correctly"
      render "posts/edit"
    end
  end

  def show; end

  def destroy
    if @post.destroy
      flash.notice = "success"
    else
      flash.alert = "error"
    end
    redirect_to root_url
  end

  private
  def get_posts
    @posts = Post.all
  end

  def get_post
    @post = @posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :author, :content, :picture)
  end
end
