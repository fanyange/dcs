class DocumentsController < ApplicationController

  before_action :set_document, only: [:show, :edit, :update, :destroy]

  def index
    @leader_id = params[:leader_id]
    @query = params[:search]

    unless @leader_id.blank?
      @documents = Leader.find(@leader_id).working
    else
      @documents = Document.order(updated_at: :desc)
    end

    unless @query.blank?
      @documents = @documents.where("number like '%#{@query}%' or self_number like '%#{@query}%' or title like '%#{@query}%'")
    end
  end

  def new
    @document = Document.new
  end

  def show
    @instruction = @document.instructions.build
  end

  def edit
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      location = @document.locations.build(location_params)
      if location.save
        redirect_to documents_path
      else
        render 'new'
      end
    else
      render 'new'
    end
  end

  def update
    if @document.update(document_params)
      redirect_to @document
    else
      render 'edit'
    end
  end

  def destroy
    @document.destroy
    redirect_to documents_url
  end

  private
  def set_document
    @document = Document.find(params[:id])
  end

  def document_params
    params.require(:document).permit(:title, :number, :self_number)
  end

  def location_params
    params.require(:location).permit(:leader_id)
  end
end
