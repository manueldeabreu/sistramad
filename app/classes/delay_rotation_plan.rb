class DelayRotationPlan < SystemProcedure
  include EmailService

  def initialize     
    self.name = "Prórroga del Plan de Rotación"
    self.code = "T-PPR203"
  end
  
  def generate_workflow(procedure)
    workflow = Workflow.new()
    workflow.name = "Workflow Próroga del Plan de Rotación"
    workflow.description = "Flujo principal Próroga del Plan de Rotación"
    workflow.is_active = true
    workflow.procedure = procedure
    if workflow.save
      generate_steps(workflow)
    else
      # Render son error notification
    end 
  end

  def generate_steps(workflow)
    create_step(workflow, "#1", "Cargar los documentos requeridos.", "Consejo de facultad")
    create_step(workflow, "#2", "Evaluacón de los recaudos para la modificación.","Consejo de facultad")
    create_step(workflow, "#3", "Generar constacia de aprobacón","Consejo Universitario")
    create_step(workflow, "#4", "Aprobar solicitud","Consejo Universitario")
  end

  #Al momento de solicitar la evaluación de la solicitud
  def initial_requirements_valid?()
    if all_required_documents_has_attachment?
      update_procedure_elements()
      send_email(self.procedure.user, 'initial_validation_success')
      send_emails(self.procedure.users, 'initial_validation_success')
      users = User.find_group_members('C20')
      send_emails(users,'need_to_approve')
      return true
    else
      return false
    end
  end 

  def update_procedure_elements()
    self.procedure.start! 
    start_step('#1')
    approve_step?('#1') 
    start_step('#2')
  end

  #Cuando lo aprueba un administrador
  def approve_initial_requirements?
    approve_step?('#2')
  end

  def approve_generate_approval_document_step
    start_step('#3')
    approve_step?('#3')
  end 

  def approve(start_date)
    if can_be_approved?()
      approve_procedure()
    end       
  end

  def can_be_approved?
    step_approved?('#1') &&  step_approved?('#2') && step_approved?('#3')
  end
  
  def step_approved?(step_name)
    self.procedure.steps.find_by(name: "#{step_name}").approved?
  end  

  def approve_procedure
      start_step('#4')
      approve_step?('#4')
      self.procedure.approve!
  end

end