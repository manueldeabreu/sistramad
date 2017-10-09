class PermanentChange < Workflow
  include EmailService
    def initialize     
      self.name = "Cambio de Dedicación Permanente"
    end
    
    def generate_workflow(professors_transfer)
      request_workflow = RequestWorkflow.new()
      request_workflow.name = "Workflow Cambio de Dedicación Permanente"
      request_workflow.description = "Flujo principal del trámite de Cambio de Dedicación Permanente"
      request_workflow.is_active = true
      request_workflow.professors_transfer = professors_transfer
      if request_workflow.save
        generate_steps(request_workflow)
      else
        # Render son error notification
      end 
    end
  
    #Definir ROLES INVOLUCRADOS para cada paso
    def generate_steps(request_workflow)
      #buscar los roles responsables en cda paso
      create_step(request_workflow, 1, "Evaluación de Recaudos iniciales","asuntos")
      create_step(request_workflow, 2, "Aprobacion de Jefe de Departamento y Remisión de juicio a Decano.","Consejo_Departamento")
      create_step(request_workflow, 3, "Verificar Aval Academico y Presupuestario","decano")
      create_step(request_workflow, 4, "Analisis y Remisión de juicio a Consejo de Facultad","decano")
      create_step(request_workflow, 5, "Analisis Final de Traslado","Consejo_Facultad")
    end
  
    def initial_requirements_valid?()
      if self.professors_transfer.IP?
        start_step(1)
        send_email(self.professors_transfer.user, 'initial_validation_success')
        step = self.professors_transfer.request_workflow.workflow_step.find_by(step_number: 1)
        users = Role.find_by(id: step.role_id).users
        send_emails(users,'need_to_approve')
        return true
      else
        return false
      end
    end
  
    def approve_initial_requirements?
      approve_step?(1)
    end
    
    def update_procedure_elements()
      self.professors_transfer.procesar! 
      start_step(1)
    end
  
    def approve_final_step
      approve_final?(5)
    end
    
  end