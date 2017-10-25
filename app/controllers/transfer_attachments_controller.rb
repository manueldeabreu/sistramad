class TransferAttachmentsController < ApplicationController
  before_action :set_user
  before_action :set_transfer_attachment, only: [:edit,:update,:download]
  before_action :set_formalities_master, only: [:new,:edit]
  before_action :authenticate_user!

  def new
    @transfer_attachment = TransferAttachment.new
    #Aqui se mostraran documentos dependiendo del trámite hay que pasar el parámetro del trámite 
    @transfer_documents = FormalitiesMaster.find_by(id: params[:tramite]).transfer_documents
    @formalities_master = FormalitiesMaster.find_by(id: params[:tramite])    
    @trasfer_document = TransferDocument.new
  end

  def index
    @attachments = TransferAttachment.all
  end

  def show

  end  

  def edit
    #@formalities_master = FormalitiesMaster.find_by(id: params[:format])
  end

  def create_inform

    a = params[:transfer_attachment]
    @transfer_attachment = TransferAttachment.new(inform_params)

    if @transfer_attachment.save
      redirect_to informs_joint_plans_path
    end

  end


  def create
    inform = false
    uploads = params[:tramite][:docs_uploaded].to_i
    docsToUpload= params[:tramite][:docs].to_i
    #a = params[:attachments]
    a = params.to_unsafe_h.slice(:transfer_attachments)
    if (docsToUpload != uploads )
      a.each do |attachment|
        if attachment[1] != nil
          #doc = attachment[1]
          attach = attachment[1]
          attach.each do |doc|
            if doc[1][:file] != nil
                uploads += 1
                @transfer_attachment = current_user.attachments.new(attachment_params(doc[1]))
                @transfer_attachment.save
              if doc[1][:transfer_document_id] == '16' || doc[1][:transfer_document_id] == '17'
                inform = true
              end
            end
          end  
        end
      end
    end  

    if (docsToUpload != uploads)
      if @transfer_attachment.save && !inform
        instance =FormalitiesMaster.find_by(id: params[:tramite][:id]).table_manager.classify.constantize
        if (instance.where('process_type = ? and user_id =?',params[:tramite][:id],current_user.id).empty?)
         #if (instance.find_by(user_id: current_user.id,process_type: params[:tramite][:id]).nil?)
          formalities_master = FormalitiesMaster.find_by(id: params[:tramite][:id])
          @instance =  instance.new(user_id: current_user.id,name: formalities_master.name, process_type: formalities_master)
          if (params[:tramite]== 1)
            if (params[:tramite][:docs].to_i == uploads) 
              @instance.procesar!
            end
            respond_to do |format|
              if @instance.save
                  format.html { redirect_to edit_professors_transfer_path (@instance), 
                    notice: 'Para terminar de Solicitar indique Facultad de Origen y Destino.' }
                  format.json { render :show, status: :created, location: @instance }
              else
                format.html { render :new }
                format.json { render json: @instance.errors, status: :unprocessable_entity }
              end
            end
          elsif (params[:tramite]== 3)
            if (params[:tramite][:docs].to_i == uploads)   
              #@instance.procesar
            end
            respond_to do |format|
              if @instance.save
                  format.html { redirect_to edit_professors_transfer_path (@instance), 
                    notice: 'Para terminar de Solicitar indique Facultad de Origen y Destino.' }
                  format.json { render :show, status: :created, location: @instance }
              else
                format.html { render :new }
                format.json { render json: @instance.errors, status: :unprocessable_entity }
              end
            end  
          else
            respond_to do |format|
                if @instance.save
                    format.html { redirect_to @instance, notice: 'El Trámite se Solicito Correctamente.' }
                    format.json { render :show, status: :created, location: @instance }
                else
                  format.html { render :new }
                  format.json { render json: @instance.errors, status: :unprocessable_entity }
                end
            end
          end  
        else
          @instance = instance.where('process_type = ? and user_id =? and status = ?',params[:tramite][:id],current_user.id,'DR').first
          #@instance = instance.find_by(user_id: current_user.id, process_type: params[:tramite])
          if ((params[:tramite][:docs].to_i == uploads) && ((params[:tramite][:id].to_i == 1)||(params[:tramite][:id].to_i == 3)))
            if (params[:tramite][:id].to_i == 1)
              @instance.procesar!
            end  
            @instance.save
            respond_to do |format|
              if @instance.save
                  format.html { redirect_to edit_professors_transfer_path (@instance),notice: '' }
                  format.json { render :show, status: :created, location: @instance }
              else
                format.html { render :new }
                format.json { render json: @instance.errors, status: :unprocessable_entity }
              end
            end
          else
            respond_to do |format|
              format.html { redirect_to professors_transfer_path (@instance.id),notice: '' }
            end
          end  
        end      
      else
        redirect_to informs_joint_plans_path , notice: "Informe subido exitosamente"
      end
    elsif (docsToUpload == uploads)
      instance =FormalitiesMaster.find_by(id: params[:tramite][:id]).table_manager.classify.constantize
      if (instance.where('process_type = ? and user_id =?',params[:tramite][:id],current_user.id).empty?)
        #if (instance.find_by(user_id: current_user.id,process_type: params[:tramite][:id]).nil?)
        formalities_master = FormalitiesMaster.find_by(id: params[:tramite][:id])
        @instance =  instance.new(user_id: current_user.id,name: formalities_master.name, process_type: formalities_master)
        if (formalities_master.id==1)
          if (params[:tramite][:docs].to_i == uploads) 
            @instance.procesar!
            respond_to do |format|
              if @instance.save
                  format.html { redirect_to edit_professors_transfer_path (@instance),notice: '' }
                  format.json { render :show, status: :created, location: @instance }
              else
                format.html { render :new }
                format.json { render json: @instance.errors, status: :unprocessable_entity }
              end
            end
          else
            respond_to do |format|
              format.html { redirect_to professors_transfer_path (@instance.id),notice: '' }
            end
          end
        elsif (formalities_master.id==3)
          if (params[:tramite][:docs].to_i == uploads) 
            #@instance.procesar
            respond_to do |format|
              if @instance.save
                  format.html { redirect_to edit_professors_transfer_path (@instance),notice: '' }
                  format.json { render :show, status: :created, location: @instance }
              else
                format.html { render :new }
                format.json { render json: @instance.errors, status: :unprocessable_entity }
              end
            end
          else
            respond_to do |format|
              format.html { redirect_to professors_transfer_path (@instance.id),notice: '' }
            end
          end    
        else
          respond_to do |format|
              if @instance.save
                  format.html { redirect_to @instance, notice: 'El Trámite se Solicito Correctamente.' }
                  format.json { render :show, status: :created, location: @instance }
              else
                format.html { render :new }
                format.json { render json: @instance.errors, status: :unprocessable_entity }
              end
          end
        end  
      else
        #@instance = instance.find_by(user_id: current_user.id, process_type: params[:tramite][:id])
        @instance = instance.where('process_type = ? and user_id =? and status = ?',params[:tramite][:id],current_user.id,'DR').first
        if ((params[:tramite][:docs].to_i == uploads) && ((params[:tramite][:id].to_i == 1)||(params[:tramite][:id].to_i == 3)))
          if (params[:tramite][:id].to_i == 1)
            @instance.procesar!
          end 
          #@instance.procesar
          @instance.save
          respond_to do |format|
            if @instance.save
                format.html { redirect_to edit_professors_transfer_path (@instance),notice: '' }
                format.json { render :show, status: :created, location: @instance }
            else
              format.html { render :new }
              format.json { render json: @instance.errors, status: :unprocessable_entity }
            end
          end
        else
          respond_to do |format|
            format.html { redirect_to professors_transfer_path (@instance.id),notice: '' }
          end
        end  
      end 
    end  
  end

  def update
    doc = params[:transfer_attachment]
    if doc[:transfer_document_id] != nil
        if doc[:file] != nil
            respond_to do |format|
              if @transfer_attachment.update(transfer_attachment_params(doc))
                format.html { redirect_to new_transfer_attachment_path(:tramite => params[:tramite][:id]) , 
                notice: 'El Recaudo se Actualizo Correctamente.' }
                format.json { render :show, status: :ok, location: @transfer_attachment }
              else
                format.html { render :edit }
                format.json { render json: @transfer_attachment.errors, status: :unprocessable_entity }
              end
            end
        end
    end        
  end
  
  def download
    
        file_origin = Rails.root.to_s+'/public'
        @user = User.find(params[:user_id])
        filename = @transfer_attachment.transfer_document.name+'_'+@user.first_name.capitalize+'_'+
        @user.middle_name.capitalize+'_'+@user.last_name.capitalize+'.zip'
        file = Tempfile.new(filename)
    
        begin
          Zip::OutputStream.open(file) { |zos| }
          #Añadiendo archivos al Zip
          Zip::File.open(file.path, Zip::File::CREATE) do |zipfile|
              zipfile.add(@transfer_attachment.file_file_name, file_origin + @transfer_attachment.file.url(:original, false))
          end
          
          zip_data = File.read(file.path)
    
          send_data(zip_data, :type => 'application/zip', :filename => filename)
        ensure
          #Close and delete the temp file
          file.close
          file.unlink
        end
    
      end

  private
    def set_user
      @user = current_user
    end
    
    def set_transfer_attachment
      @transfer_attachment = TransferAttachment.find(params[:id])
    end

    def set_formalities_master
      @formalities_master = FormalitiesMaster.find_by_id(params[:tramite])
    end

    #def attachment_params (document)
    #  document.permit(:document_id,:file)
    #end

    def transfer_attachment_params (transfer_document)
      
          ActionController::Parameters.new(transfer_document).permit(:transfer_document_id,:file)
    end
end
