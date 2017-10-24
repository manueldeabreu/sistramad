class TransferDocumentsController < ApplicationController
  before_action :set_transfer_document, only: [:show, :edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    @transfer_documents = TransferDocument.all
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
  end

  # GET /documents/new

  def new
    @transfer_document = TransferDocument.new
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
    @transfer_document = TransferDocument.new(transfer_document_params)

    respond_to do |format|
      if @transfer_document.save
        format.html { redirect_to @transfer_document, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @transfer_document }
      else
        format.html { render :new }
        format.json { render json: @transfer_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @transfer_document.update(transfer_document_params)
        format.html { redirect_to @transfer_document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @transfer_document }
      else
        format.html { render :edit }
        format.json { render json: @transfer_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @transfer_document.destroy
    respond_to do |format|
      format.html { redirect_to transfer_documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transfer_document
      @transfer_document = TransferDocument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transfer_document_params
      params.require(:transfer_document).permit(:name, :status)
    end
end


