class CommentsController < ApplicationController
	load_and_authorize_resource
	
	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new(content:params[:comment][:content], user: current_user)
		@post.comments << @comment
		@comment.save
		redirect_to @post
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		@comment.destroy
		if current_user.admin?
			redirect_to @post, notice: 'Eres una admin y borraste un comentario'
		else
			redirect_to @post, notice: 'Eres un usuario normal borrando su comentario'
		end
	end
	private
	def comment_params
      params.require(:comment).permit(:comment, :content)
    end
end
