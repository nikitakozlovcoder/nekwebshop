# controller for creating and editing comments
# TODO implement actions functionality
class PostsController < ApplicationController
  # create comment
  def new

  end
  def delete
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!"
    @post = Post.find params[:id]
    if current_user && @post.user.id == current_user.id
      product = @post.product
      @post.delete
      product.recalc_mark
    end
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
        hash[:user_name] = @post.user.name
        hash[:avatar] = @post.user.avatar.attached? ? url_for(@post.user.avatar) : '../assets/no_avatar.png'
        hash[:post] = @post
        hash[:current_user] = current_user.id
        @post.images.each { |img| hash[:images] << url_for(img) }
        Product.find(@post.product_id).recalc_mark
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
