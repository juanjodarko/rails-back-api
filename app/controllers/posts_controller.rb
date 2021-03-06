class PostsController < ApplicationController
  before_action :set_post, only: [:update, :show, :destroy]

  def index
    if params['max']
      @posts = Post.all.order('created_at DESC').limit(params['max'])
    else
      @posts = Post.all.order('created_at DESC')
    end
    json_response(@posts)
  end

  def create
    @post = Post.create!(post_params)
    json_response(@post, :created)
  end

  def show
    json_response(@post)
  end

  def update
    @post.update(post_params)
    head :no_content
  end

  def destroy
    @post.destroy
    head :no_content
  end

  private

  def post_params
    params.permit(:title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
