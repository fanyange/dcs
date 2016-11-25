class LocationsController < ApplicationController

  def create
    @document = Document.find(params[:document_id])
    @now_location = @document.locations.build(location_params)
    @now_location.save
    flash[:success] = "成功提交文件给 #{@now_location.leader.name}"
    redirect_to @document
  end

  private
  def location_params
    params.require(:location).permit(:leader_id)
  end
end
