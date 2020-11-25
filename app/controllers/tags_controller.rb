class TagsController < ApplicationController
  def index
    render json: Campaign.find(campaign_params["id"].to_i).tags
  end

  def create
    tag= Campaign.find(campaign_params["id"].to_i).tags.new(tags_params)
    if tag.save
        render json: tag
    end
  end

  
  private

  def tags_params
    params.require(:tag).permit(:id, :name)
  end
  def campaign_params
    params.require(:campaign).permit(:id)
  end
  end