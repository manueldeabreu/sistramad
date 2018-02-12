class TemporalChange < Workflow
  include EmailService
    def initialize     
      self.name = "Cambio de Dedicación Temporal"
    end
    
    def generate_workflow(professors_transfer)
      request_workflow = RequestWorkflow.new()
      request_workflow.name = "Workflow Cambio de Dedicación Temporal"
      request_workflow.description = "Flujo principal del trámite de Cambio de Dedicación Temporal"
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
      create_step(request_workflow, 1, "Evaluación de Recaudos iniciales","asuntos_profesorales")
      create_step(request_workflow, 2, "Aprobación de Jefe de Departamento y Remisión de Resolución a Decano.","jefe_departamento")
      create_step(request_workflow, 3, "Verificar Aval Académico y Presupuestario","decano")
      create_step(request_workflow, 4, "Análisis y Remisión de Resolución a Consejo de Facultad","decano")
      create_step(request_workflow, 5, "Análisis Final de Traslado","consejo_facultad")
    end
  
    def initial_requirements_valid?()
      if self.professors_transfer.IP?
        start_step(1)
        send_email_transfer(self.professors_transfer.user, 'initial_validation_success',self.professors_transfer)
        step = self.professors_transfer.request_workflow.workflow_step.find_by(step_number: 1)
        users = Role.find_by(id: step.role_id).users
        send_emails_transfer(users,'need_to_approve',self.professors_transfer)
        return true
      else
        return false
      end
    end
  
    def approve_initial_requirements?
      approve_step?(1)
    end

    def reject_initial_requirements?
      reject_step?(1)
    end
    
    def update_procedure_elements()
      self.professors_transfer.procesar! 
      start_step(1)
    end

    def approve_final_step
      send_email_transfer(self.professors_transfer.user,'approve',self.professors_transfer)
      approve_final?(5)
    end
  
    def decline_final_step
      send_email_transfer(self.professors_transfer.user, 'decline',self.professors_transfer)
      decline_final?(5)
    end
    
  end