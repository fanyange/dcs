class DocumentsController < ApplicationController

  before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user

  def all_index
    if helpers.current_user.admin
      @documents = Document.order(updated_at: :desc).paginate(page: params[:page])
      render :index
    else
      flash[:warning] = '权限不足'
      redirect_to root_path
    end
  end

  def index
    @leader_id = params[:leader_id]
    @query = params[:search]

    unless @leader_id.blank?
      @documents = Leader.find(@leader_id).working.paginate(page: params[:page])
    else
      @documents = Document.order(updated_at: :desc).paginate(page: params[:page])
    end

    unless @query.blank?
      @documents = @documents.where("number like '%#{@query}%' or self_number like '%#{@query}%' or title like '%#{@query}%'")
    end

    @documents = @documents.of(helpers.current_user)
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
    @document.locations.build(location_params)
    if @document.save
      flash[:success] = '成功创建文件'
      redirect_to @document
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
    params.require(:document).permit(:title, :number, :self_number, :user_id)
  end

  def location_params
    params.require(:location).permit(:leader_id)
  end
end
