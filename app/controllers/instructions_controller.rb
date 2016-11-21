class InstructionsController < ApplicationController
  before_action :set_document_and_instruction, only: [:show, :edit, :update, :destroy]
  before_action :set_referer, only: [:edit, :update, :destroy]

  def index
    @leader_id = params[:leader_id]
    unless @leader_id.blank?
      @instructions = Leader.find(@leader_id).instructions.where.not(deadline: nil).order('deadline, created_at DESC')
    else
      @instructions = Instruction.order('deadline IS NULL, deadline').order(:created_at => :desc)
    end
  end

  def show
  end

  def new
    @instruction = Instruction.new
  end

  def edit
  end

  def create
    @document = Document.find(params[:document_id])
    @instruction = @document.instructions.build(instruction_params)

    if @instruction.save
      redirect_to @document, notice: 'Instruction was successfully created.' 
    else
      render 'documents/show'
    end
  end

  def update
    if @instruction.update(instruction_params)
      redirect_to session[:referer], notice: 'Instruction was successfully created.' 
      session[:referer] = nil
    else
      render :edit
    end
  end

  def destroy
    @instruction.destroy
    redirect_to session[:referer]
    session[:referer] = nil
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_document_and_instruction
    @document = Document.find(params[:document_id])
    @instruction = Instruction.find(params[:id])
  end

  def set_referer
    session[:referer] ||= request.headers['Referer']
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def instruction_params
    params.require(:instruction).permit(:content, :deadline, :document_id, :leader_id)
  end
end
