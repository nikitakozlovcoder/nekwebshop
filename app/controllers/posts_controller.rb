# controller for creating and editing comments
# TODO implement actions functionality
class PostsController < ApplicationController
  # create comment
  def new

  end

  # TODO add actions for:
  # delete comment
  # edit comment
  def create
    @post = Post.new body: params[:body], post_id: params[:id], mark: params[:mark]
    @post.user = current_user
    hash = {success: true, errors: []}
    if @post.save
      render json: hash
    else
      hash[:success] = false
      hash[:errors] = @post.errors
      render json: hash
    end
  end
end
