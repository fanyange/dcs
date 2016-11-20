class LocationsController < ApplicationController

  def create
    @document = Document.find(params[:document_id])
    @now_leader = @document.locations.build(location_params)
    @now_leader.save
    redirect_to @document
  end

  private
  def location_params
    params.require(:location).permit(:leader_id)
  end
end
