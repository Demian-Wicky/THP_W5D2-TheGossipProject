class CommentsController < ApplicationController
  def create
    anonymous_user = User.find_by(first_name: "Anonymous 👻")
    @comment = Comment.new((comment_params).merge(:user => anonymous_user))

    if @comment.save
      flash[:notice] = 'commmentaire enregistré !'
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = @comment.errors.messages.flatten.join(' ')
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :gossip_id)
  end
end
