class LikesController < ApplicationController

   def create
      post = Post.find( params[:post_id] )

      @like = Like.new( post_id: post.id, user_id: params[:user_id] )

      if @like.save
         respond_to do |format|
            format.html { redirect_to posts_path, notice: "Thanks for the like!"  }
            format.json { render json: { post_id: post.id, likes: post.likes.count } }
         end
      else
         respond_to do |format|
            format.html { redirect_to posts_path, alert: "Awwwhh snap! No likes for the likes of you." }
            format.json { render json: { post_id: post.id, errors: @like.errors }, status: :unprocessable_entity }
         end
      end
   end

end
