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
    valid = true
    hash = {success: true, errors: [], post: nil, images: []}
    if current_user

      @post = Post.new body: params[:body].strip, product_id: params[:id], mark: params[:mark]
      @post.user = current_user

      @images = params[:images]
      if @images && @images.count <= 10
        @images.each do |img|
          @post.images.attach(img);
        end
      elsif @images && @images.count > 10
        valid = false
      end



      if @post.save && valid
        hash[:post] = @post
        @post.images.each { |img| hash[:images] << url_for(img) }
        render json: hash
      else
        hash[:success] = false
        #@post.errors.messages[:images] << "qrqrqwr"
        if !valid
                @post.errors.messages[:images] << "загрузите не более 10 изображений"
        end
        hash[:errors] = @post.errors
        render json: hash
      end
    else
      hash[:success] = false
      render json: nil
    end
  end
end
