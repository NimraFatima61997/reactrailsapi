class CampaignsController < ApplicationController
  def index
    render json: Campaign.all
  end

  def create
    @campaign = current_user.campaigns.new(campaign_params)
    if @campaign.save
      render json: @campaign
    end
  end
  
  
  def destroy
    Campaign.destroy(params[:id])
  end

  def update
    campaign = Campaign.find(params[:id])
    campaign.update_attributes(campaign_params)
    render json: campaign
  end

  private

  def campaign_params
    params.require(:campaign).permit(:id, :title, :purpose, :estimated_duration)
  end
end