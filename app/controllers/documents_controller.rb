class DocumentsController < ApplicationController

  before_action :set_document, only: [:show, :edit, :update, :destroy]

  def index
    @documents = Document.order(updated_at: :desc)
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
      if @document.locations.build(location_params)
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
