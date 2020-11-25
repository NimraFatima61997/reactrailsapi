class CommentsController < ApplicationController
# protect_from_forgery with: :null_section
  def index
    if campaign_params["type"]=="Campaign"
      render json: Campaign.find(campaign_params["id"].to_i).comments
    else campaign_params["type"]=="Discussiontopics"
      render json: Campaign.find(campaign_params["id"].to_i).discussiontopics.find(discussiontopics_params["id"].to_i).comments
    end
  end

  def create
    if campaign_params["type"]=="Campaign"
      comment = Campaign.find(campaign_params["id"].to_i).comments.new(comment_params)
      comment.user_id=current_user.id
    else
      comment = Campaign.find(campaign_params["id"].to_i).discussiontopics.find(discussiontopics_params["id"].to_i).comments.new(comment_params)
      comment.user_id=current_user.id
    end
    if comment.save
      render json: comment
    end
  end

  def destroy
    Comment.destroy(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    comment.update_attributes(comment_params)
    render json: comment
  end

  private

  def comment_params
    params.require(:comment).permit(:id, :title)
  end
  def campaign_params
    params.require(:campaign).permit(:id, :type)
  end
  def discussiontopics_params
    params.require(:discussiontopic).permit(:id, :type)
  end
end