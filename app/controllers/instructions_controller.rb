class InstructionsController < ApplicationController
  before_action :set_document_and_instruction, only: [:show, :edit, :update, :destroy]

  def index
    @instructions = Instruction.order('deadline IS NULL, deadline').order(:created_at => :desc)
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
      redirect_to @document, notice: 'Instruction was successfully updated.' 
    else
      render :edit
    end
  end

  def destroy
    @instruction.destroy
    redirect_to @document, notice: 'Instruction was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_document_and_instruction
    @document = Document.find(params[:document_id])
    @instruction = Instruction.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def instruction_params
    params.require(:instruction).permit(:content, :deadline, :document_id, :leader_id)
  end
end
