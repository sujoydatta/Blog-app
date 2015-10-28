class CommentsController < ApplicationController
   before_action :logged_in_user, only: [:create, :destroy]

  def create
  	 @entry= Entry.find(params[:entry_id])
     @comment = @entry.comments.create(comment_params)
#    @entry = Entry.find(params[:entry_id])
#    @comment = @entry.comments.create({content: params[:comment][:content], entry_id: params[:entry_id], user_id: params[:user_id]}) 
     @comment.user_id= current_user.id
    if @comment.save
      flash[:success] = "Micropost created!"
      redirect_to request.referrer
    else
      flash[:notice] = "Error"
      redirect_to request.referrer
    end
  end

  def destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end

end
