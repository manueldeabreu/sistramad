class ProceduresController < ApplicationController
  before_action :set_procedure, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  # GET /procedures
  # GET /procedures.json
  def index
    @procedures = @user.procedures
  end

  # GET /procedures/1
  # GET /procedures/1.json
  def show
  end

  def new
    @procedure = Procedure.new    
  end

  # GET /procedures/1/edit
  def edit
  end

  def create
    @procedure = Procedure.new(procedure_params)
    @procedure.user = @user  
   
    respond_to do |format|
      if @procedure.save
        set_documents_to_user()
        generate_workflow()
        format.html { redirect_to @procedure, notice: 'La solicitude del trámite se ha creado exitosamente.' }
        format.json { render :show, status: :created, location: @procedure }
      else
        puts "Errors"
        puts @procedure.errors.full_messages
        @procedure.errors.full_messages
        format.html { render :new }
        format.json { render json: @procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /procedures/1
  # PATCH/PUT /procedures/1.json
  def update
    respond_to do |format|
      if @procedure.update(procedure_params)
        format.html { redirect_to @procedure, notice: 'Procedure was successfully updated.' }
        format.json { render :show, status: :ok, location: @procedure }
      else
        format.html { render :edit }
        format.json { render json: @procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /procedures/1
  # DELETE /procedures/1.json
  def destroy
    @procedure.destroy
    respond_to do |format|
      format.html { redirect_to procedures_path, notice: 'La solicitud fue cancelada con éxito.' }
      format.json { head :no_content }
    end
  end

  private

    def procedure_params
      params.require(:procedure).permit(:name, documents_attributes: [:id,:name, :attachment])
    end

    def set_procedure
      @procedure = Procedure.find(params[:id])
    end

    def documents_look_up
      DocumentMaster.where(procedure: "Año Sabatico", active: true)   
    end

    def set_user
      @user = User.find(current_user)
    end

    def set_documents_to_user
      @user.documents << @procedure.documents
    end

    def generate_workflow
      workflow = Workflow.new()
      #workflow = Workflow.new(name = "Workflow Año Sabatico", description = "Flujo principal del trámite para año Sabatico", is_active = true)
      workflow.name = "Workflow Año Sabatico"
      workflow.description = "Flujo principal del trámite para año Sabatico"
      workflow.is_active = true
      workflow.procedure = @procedure

      if workflow.save
        generate_steps(workflow)
      else

      end 

    end

    def generate_steps(workflow)
      step = Step.new()
      #step = Steps.new(name = "paso 1", description = "description paso 1", status = "created", is_active = true)
      step.name = "paso 1"
      step.description = "descripcion del paso 1"
      step.status = "created"
      step.is_active = true
      step.workflow = workflow
      step.save

      step = Step.new()
      #step = Steps.new(name = "paso 1", description = "description paso 1", status = "created", is_active = true)
      step.name = "paso 2"
      step.description = "descripcion del paso 2"
      step.status = "created"
      step.is_active = true
      step.workflow = workflow
      step.save

    end
end
