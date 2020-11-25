class DiscussiontopicsController < ApplicationController
  def index
    render json: Campaign.find(campaign_params["id"].to_i).discussiontopics
  end

  def destroy
    DiscussionTopic.destroy(params[:id])
  end

  def update
    discussiontopic = DiscussionTopic.find(params[:id])
    discussiontopic.update_attributes(discussiontopic_params)
    render json: discussiontopic
  end

  def create
    if (current_user.user_type=="Novice" && (current_user.status=="not_qualified" || current_user.status==="banned"))
    else
      creat_or_not=true
      campaign=Campaign.find(campaign_params["id"].to_i)
      byebug
      campaign_user=User.find(campaign.user_id)
      all_campaigns=campaign_user.campaigns.all
      all_campaigns.each do |c|
        byebug
        if c.id!=campaign.id
          byebug
          all_discussion_topics=c.discussiontopics.all
          all_discussion_topics.each do |discussiontopic|
            discussiontopic_user=User.find(discussiontopic.user_id)
              if discussiontopic_user.id===current_user.id 
                creat_or_not=false  
              end
            end 
         end
      end
      if(creat_or_not===true || current_user.user_type==="Expert")
        discussiontopic= Campaign.find(campaign_params["id"].to_i).discussiontopics.new(discussiontopic_params)
        discussiontopic.user_id=current_user.id
        if discussiontopic.save
            render json: discussiontopic
        end
      end
    end 
  end

  private

  def discussiontopic_params
    params.require(:discussiontopic).permit(:id, :title)
  end
  def campaign_params
    params.require(:campaign).permit(:id)
  end
end