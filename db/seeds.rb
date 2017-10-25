# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#  Mayor.create(name: 'Emanuel', city: cities.first)

#Role.new(name: "system_admin").save
#Role.new(name: "admin").save

#Carga grupos de usuarios y roles
Group.new(name: "Dirección de asuntos profesorales", code: "D20", description: "Miembros de la dirección de asuntos profesorales", active: true).save
#Role.new(name: "asuntos_profesorales").save

Group.new(name: "Consejo de departamento", code: "C10", description: "Miembros del consejo de departamento", active: true).save
#Role.new(name: "consejo_departamento").save

Group.new(name: "Consejo de facultad", code: "C20", description: "Miembros del consejo de facultad", active: true).save
#Role.new(name: "consejo_facultad").save

Group.new(name: "Representante de Facultad", code: "R10", description: "Representantes de Facultad", active: true).save
#Role.new(name: "representante_facultad").save

Group.new(name: "Consejo Universitario", code: "C30", description: "Concejo Universitario", active: true).save
#Role.new(name: "consejo_universitario").save

Group.new(name: "Jefe de Departamento", code: "J10", description: "Jefe de Departamento", active: true).save
#Role.new(name: "jefe_departamento").save

Group.new(name: "Director de Departamento", code: "D30", description: "Director del Departamento", active: true).save
#Role.new(name: "director_departamento").save

Group.new(name: "Decano", code: "D40", description: "Decano", active: true).save
#Role.new(name: "decano").save

Group.new(name: "Director de Escuela", code: "D50", description: "Director del Departamento", active: true).save
#Role.new(name: "director_escuela").save

#Usuarios con Roles
#user = User.new(:username => 'test',
Role.create!([
  {name: "admin", resource_id: nil, resource_type: nil},
  {name: "test", resource_id: nil, resource_type: nil},
  {name: "docente", resource_id: nil, resource_type: nil},
  {name: "decano", resource_id: nil, resource_type: nil},
  {name: "asuntos_profesorales", resource_id: nil, resource_type: nil},
  {name: "departamento", resource_id: nil, resource_type: nil},
  {name: "consejo_departamento", resource_id: nil, resource_type: nil},
  {name: "consejo_facultad", resource_id: nil, resource_type: nil},
  {name: "Consejo_escuela", resource_id: nil, resource_type: nil},
  {name: "consejo_universitario", resource_id: nil, resource_type: nil},
  {name: "jefe_departamento", resource_id: nil, resource_type: nil},
  {name: "system_admin", resource_id: nil, resource_type: nil},
  {name: "representante_facultad", resource_id: nil, resource_type: nil},
  {name: "director_departamento", resource_id: nil, resource_type: nil},
  {name: "director_escuela", resource_id: nil, resource_type: nil}
])

user = User.new(:id => 1,
                :username => 'admin',
                :email => 'admin@admin.com',
                :password => '123456', #Devise.friendly_token[0,20]
                :password_confirmation => '123456')
user.add_role(:admin)
user.add_role(:system_admin)                 
user.save!(:validate => false)

user = User.new(:id => 2,
                :username => 'test',
                :email => 'test@test.com',
                :password => '123456', #Devise.friendly_token[0,20]
                :password_confirmation => '123456')
user.add_role(:test)                
user.save!(:validate => false)

user = User.new( :id => 3,
                :username => 'joalbert',
                :email => 'joalbertgonzalez@gmail.com',
                :first_name => 'joalbert',
                :middle_name => 'andrés',
                :last_name => 'gonzález',
                :identification_document => '18468784',
                :birthday => "24/11/1988".to_date,
                :password => '123456', #Devise.friendly_token[0,20]
               :password_confirmation => '123456')
user.add_role(:admin)
user.add_role(:test)
user.save!(:validate => false)

user = User.new(:id => 8,
                :username => 'jesusdeabreu',
                :email => 'jmanueldeabreum2@gmail.com',
                :first_name => 'jesus',
                :middle_name => 'manuel',
                :last_name => 'de abreu',
                :genre => 'm',
                :identification_document => '18241890',
                :birthday => "21/12/1988".to_date,
                :password => 'jmdam182', #Devise.friendly_token[0,20]
                :password_confirmation => 'jmdam182')
user.add_role(:admin)
user.add_role(:system_admin)
user.add_role(:test)
user.add_role(:docente)                
user.save!(:validate => false)

user = User.new(:id => 4,
                :username => 'lisset',
                :email => 'liss612@gmail.com',
                :first_name => 'lisset',
                :middle_name => 'alexandra',
                :last_name => 'orozco',
                :genre => 'f',
                :identification_document => '18686803',
                :birthday => "06/10/1987".to_date,
                :password => '123456', #Devise.friendly_token[0,20]
                :password_confirmation => '123456')
user.add_role(:test)                
user.save!(:validate => false)


user = User.new(:id => 13,
                :username => 'decano',
                :email => 'decano@test.com',
                :first_name => 'jose',
                :middle_name => 'x',
                :last_name => 'marcano',
                :genre => 'm',
                :identification_document => '1000',
                :birthday => "06/10/1960".to_date,
                :password => '123456', #Devise.friendly_token[0,20]
                :password_confirmation => '123456')
user.add_role(:admin)                
user.add_role(:docente)
user.add_role(:decano)                
user.save!(:validate => false)


user = User.new(:id => 14,
                :username => 'asuntos',
                :email => 'jmanueldeabreum@gmail.com',
                :first_name => 'Dirección de asuntos profesorales',
                :middle_name => 'x',
                :last_name => '',
                :genre => 'm',
                :identification_document => '1000',
                :birthday => "06/10/1960".to_date,
                :password => '123456', #Devise.friendly_token[0,20]
                :password_confirmation => '123456')
user.add_role(:docente)
user.add_role(:admin)
user.add_role(:asuntos_profesorales)
user.save!(:validate => false)

user = User.new(:id => 15,
                :username => 'iperez',
                :email => 'jemadam@hotmail.com',
                :first_name => 'Ivan',
                :middle_name => 'Enrique',
                :last_name => 'Perez',
                :genre => 'm',
                :identification_document => '19878987',
                :birthday => "1990-12-14".to_date,
                :password => '123456', #Devise.friendly_token[0,20]
                :password_confirmation => '123456')
user.add_role(:docente)
user.save!(:validate => false)

user = User.new(:id => 24,
                :username => 'consejouniversitario',
                :email => 'consejoUniversitario@test.com',
                :first_name => 'Consejo',
                :middle_name => 'x',
                :last_name => 'Universitario',
                :genre => 'm',
                :identification_document => '1001',
                :birthday => "06/10/1970".to_date,
                :password => '123456', #Devise.friendly_token[0,20]
                :password_confirmation => '123456')
user.add_role(:consejo_universitario)
user.add_role(:admin)
user.save!(:validate => false)

user = User.new(:id => 21,
                :username => 'departamento',
                :email => 'Departamento@test.com',
                :first_name => 'Departamento',
                :middle_name => 'x',
                :last_name => 'Departamento',
                :genre => 'm',
                :identification_document => '1002',
                :birthday => "06/10/1966".to_date,
                :password => '123456', #Devise.friendly_token[0,20]
                :password_confirmation => '123456')
user.add_role(:departamento)
user.add_role(:admin)
user.save!(:validate => false)                

user = User.new(:id => 22,
                :username => 'consejoescuela',
                :email => 'consejoEscuela@test.com',
                :first_name => 'Consejo',
                :middle_name => 'x',
                :last_name => 'Escuela',
                :genre => 'm',
                :identification_document => '1003',
                :birthday => "06/10/1967".to_date,
                :password => '123456', #Devise.friendly_token[0,20]
                :password_confirmation => '123456') 
user.add_role(:consejo_escuela)
user.save!(:validate => false) 


user = User.new(:id => 20,
                :username => 'consejodepartamento',
                :email => 'consejoDepartamental@test.com',
                :first_name => 'Consejo',
                :middle_name => 'x',
                :last_name => 'Departamental',
                :genre => 'm',
                :identification_document => '1001',
                :birthday => "06/10/1965".to_date,
                :password => '123456', #Devise.friendly_token[0,20]
                :password_confirmation => '123456')
user.add_role(:consejo_departamento)
user.add_role(:admin)
user.save!(:validate => false)

user = User.new(:id => 23,
                :username => 'consejofacultad',
                :email => 'consejoFacultad@test.com',
                :first_name => 'Consejo',
                :middle_name => 'x',
                :last_name => 'Facultad',
                :genre => 'm',
                :identification_document => '1004',
                :birthday => "06/10/1968".to_date,
                :password => '123456', #Devise.friendly_token[0,20]
                :password_confirmation => '123456')
user.add_role(:consejo_facultad) 
user.add_role(:admin)                 
user.save!(:validate => false)

user = User.new( :id => 5,
:username => 'lfagundez',
:email => 'lfagundez@outlook.com',
:first_name => 'Luis',
:middle_name => '',
:last_name => 'Fagundez',
:genre => 'm',
:identification_document => '18347734',
:birthday => "23/09/1989".to_date,
:password => '123456', #Devise.friendly_token[0,20]
:password_confirmation => '123456')
user.add_role(:admin)
user.add_role(:system_admin)
user.add_role(:test)
user.add_role(:docente)                
user.save!(:validate => false)

user = User.new(:id => 6,
                :username => 'amatute',
                :email => 'alexghoro@outlook.com',
                :first_name => 'Alejandro',
                :middle_name => '',
                :last_name => 'Matute',
                :genre => 'm',
                :identification_document => '18347734',
                :birthday => "15/08/1988".to_date,
                :password => '123456', #Devise.friendly_token[0,20]
                :password_confirmation => '123456')
user.add_role(:admin)
user.add_role(:system_admin)
user.add_role(:test)
user.add_role(:docente)                
user.save!(:validate => false)

user = User.new(:id => 7,
                :username => 'jceballos',
                :email => 'jonnyceballos@gmail.com',
                :first_name => 'Jonny',
                :middle_name => '',
                :last_name => 'Ceballos',
                :genre => 'm',
                :identification_document => '17755525',
                :birthday => "02/06/1986".to_date,
                :password => '123456', #Devise.friendly_token[0,20]
                :password_confirmation => '123456')
user.add_role(:admin)
user.add_role(:system_admin)
user.add_role(:test)
user.add_role(:docente)                
user.save!(:validate => false)

user = User.new( :id => 9,
        :username => 'repfac',
        :email => 'representantedefacultad@correo.com',
        :first_name => 'Representante de Facultad',
        :middle_name => '',
        :last_name => ' ',
        :genre => 'm',
        :identification_document => '40',
        :birthday => "15/08/1988".to_date,
        :password => '123456', #Devise.friendly_token[0,20]
        :password_confirmation => '123456')
user.add_role(:representante_facultad)
user.add_role(:admin)
user.save!(:validate => false)


user = User.new(:id => 10,
        :username => 'jefe_departamento',
        :email => 'jefedepartamento@correo.com',
        :first_name => 'Jefe de Departamento',
        :middle_name => '',
        :last_name => ' ',
        :genre => 'm',
        :identification_document => '60',
        :birthday => "15/08/1988".to_date,
        :password => '123456', #Devise.friendly_token[0,20]
        :password_confirmation => '123456')
user.add_role(:jefe_departamento)
user.add_role(:admin)
user.save!(:validate => false)

user = User.new(:id => 11,
        :username => 'dirdep',
        :email => 'direcciondepartamento@correo.com',
        :first_name => 'Director de Departamento',
        :middle_name => '',
        :last_name => ' ',
        :genre => 'm',
        :identification_document => '70',
        :birthday => "15/08/1988".to_date,
        :password => '123456', #Devise.friendly_token[0,20]
        :password_confirmation => '123456')
user.add_role(:director_departamento)
user.add_role(:admin)
user.save!(:validate => false)

user = User.new(:id => 12,
        :username => 'director_escuela',
        :email => 'directorescuela@correo.com',
        :first_name => 'Director Escuela',
        :middle_name => '',
        :last_name => ' ',
        :genre => 'm',
        :identification_document => '90',
        :birthday => "15/08/1988".to_date,
        :password => '123456', #Devise.friendly_token[0,20]
        :password_confirmation => '123456')
user.add_role(:director_escuela)
user.add_role(:admin)
user.save!(:validate => false)


#Carga el Maestro de Documentos:

#Año Sabático:
DocumentMaster.new(name: "Cédula de Identidad", code: "CI", procedure: "Año Sabático", active: true , initially_required: true ).save
DocumentMaster.new(name: "RIF", code: "RIF", procedure: "Año Sabático", active: true, initially_required: true ).save
DocumentMaster.new(name: "Carta de Aceptación", code: "CAC", procedure: "Año Sabático", active: true, initially_required: true ).save
DocumentMaster.new(name: "Utimo ascenso", code: "UAS", procedure: "Año Sabático", active: true , initially_required: true).save
DocumentMaster.new(name: "Sintesis curricular", code: "SCU", procedure: "Año Sabático", active: true , initially_required: true).save
DocumentMaster.new(name: "Solvencia Biblioteca", code: "SBI", procedure: "Año Sabático", active: true, initially_required: true ).save
DocumentMaster.new(name: "Solvencia DAE", code: "SDAE", procedure: "Año Sabático", active: true , initially_required: true).save
DocumentMaster.new(name: "Certificado de idioma", code: "CID", procedure: "Año Sabático", active: true , initially_required: true).save
DocumentMaster.new(name: "Plan de Trabajo", code: "PDT", procedure: "Año Sabático", active: true , initially_required: false).save
DocumentMaster.new(name: "Constancia de antiguedad", code: "CDA", procedure: "Año Sabático", active: true , initially_required: false).save
DocumentMaster.new(name: "Constancia de aprobación", code: "CDAP", procedure: "Año Sabático", active: true , initially_required: false).save

#Modificación de Plan de Trabajo:
DocumentMaster.new(name: "Plan de Trabajo Modificado", code: "PDTM", procedure: "Modificación de Plan de Trabajo", active: true , initially_required: true).save
DocumentMaster.new(name: "Documento Probatorio de Modificación", code: "DPDM", procedure: "Modificación de Plan de Trabajo", active: true , initially_required: true).save
DocumentMaster.new(name: "Aprobación de Modificación del Plan de Trabajo", code: "AMPDT", procedure: "Modificación de Plan de Trabajo", active: true , initially_required: false).save

#Informe Parcial de Actividades:
DocumentMaster.new(name: "Informe Parcial", code: "IP", procedure: "Aprobación de Informe Parcial de Actividades", active: true , initially_required: true).save
DocumentMaster.new(name: "Aprobación del Informe Parcial", code: "AIP", procedure: "Aprobación de Informe Parcial de Actividades", active: true , initially_required: false).save

#Informe Final de Actividades:
DocumentMaster.new(name: "Informe Final", code: "IF", procedure: "Aprobación de Informe Final de Actividades", active: true , initially_required: true).save
DocumentMaster.new(name: "Aprobación del Informe Final", code: "AIF", procedure: "Aprobación de Informe Final de Actividades", active: true , initially_required: false).save

#Diferimiento de Año Sabático:
DocumentMaster.new(name: "Oficio de solicitud de diferimiento", code: "OSD", procedure: "Diferimiento de Año Sabático", active: true , initially_required: true).save
DocumentMaster.new(name: "Aprobación de solicitud de diferimiento", code: "ASD", procedure: "Diferimiento de Año Sabático", active: true , initially_required: false).save

#Reincorporación luego de disfrute de Año Sabático:
DocumentMaster.new(name: "Oficio de solicitud de reincorporación", code: "OSR", procedure: "Reincorporación luego del disfrute del Año Sabático", active: true , initially_required: true).save
DocumentMaster.new(name: "Aprobación de solicitud de reincorporación", code: "ASR", procedure: "Reincorporación luego del disfrute del Año Sabático", active: true , initially_required: false).save


#Plan de Formacion Especial:
DocumentMaster.new(name: "Programa de Formación Especial", code: "D-PFE", procedure: "Programa de Formación Especial", active: true , initially_required: true ).save

#Plan de Rotacion
DocumentMaster.new(name: "Cédula de Identidad", code: "CI", procedure: "Plan de Rotación", active: true , initially_required: true ).save
DocumentMaster.new(name: "RIF", code: "RIF", procedure: "Plan de Rotación", active: true, initially_required: true ).save
DocumentMaster.new(name: "Carta de Propósito", code: "D-MPC", procedure: "Plan de Rotación", active: true , initially_required: true ).save
DocumentMaster.new(name: "Carta de Asunción Compartida", code: "D-MAC", procedure: "Plan de Rotación", active: true , initially_required: true ).save
DocumentMaster.new(name: "Carta de Aceptación de Condiciones", code: "D-CAC", procedure: "Plan de Rotación", active: true , initially_required: true ).save
DocumentMaster.new(name: "Carta de Aceptación de Cumplir Plan", code: "D-ACP", procedure: "Plan de Rotación", active: true , initially_required: true ).save
DocumentMaster.new(name: "Carta de Aceptación del Departamento", code: "D-ADP", procedure: "Plan de Rotación", active: true , initially_required: true ).save

#Modificacion del Plan de Rotacion
DocumentMaster.new(name: "Cédula de Identidad", code: "CI", procedure: "Modificación del Plan de Rotación", active: true , initially_required: true ).save
DocumentMaster.new(name: "RIF", code: "RIF", procedure: "Modificación del Plan de Rotación", active: true, initially_required: true ).save
DocumentMaster.new(name: "Oficio de Solicitud", code: "D-OS", procedure: "Modificación del Plan de Rotación", active: true , initially_required: true ).save
DocumentMaster.new(name: "Modificación del Plan de Actividades", code: "D-MP", procedure: "Modificación del Plan de Rotación", active: true , initially_required: true ).save
DocumentMaster.new(name: "Documentos probatorios", code: "D-PMP", procedure: "Modificación del Plan de Rotación", active: true , initially_required: true ).save

#Modificacion del Plan de Rotacion
DocumentMaster.new(name: "Cédula de Identidad", code: "CI", procedure: "Modificación del Plan de Rotación", active: true , initially_required: true ).save
DocumentMaster.new(name: "RIF", code: "RIF", procedure: "Modificación del Plan de Rotación", active: true, initially_required: true ).save
DocumentMaster.new(name: "Oficio de Solicitud", code: "D-OS", procedure: "Modificación del Plan de Rotación", active: true , initially_required: true ).save
DocumentMaster.new(name: "Modificación del Plan de Actividades", code: "D-MP", procedure: "Modificación del Plan de Rotación", active: true , initially_required: true ).save
DocumentMaster.new(name: "Documentos probatorios", code: "D-PMP", procedure: "Modificación del Plan de Rotación", active: true , initially_required: true ).save

#Prorroga del Plan de Rotacion
DocumentMaster.new(name: "Cédula de Identidad", code: "CI", procedure: "Prórroga del Plan de Rotación", active: true , initially_required: true ).save
DocumentMaster.new(name: "RIF", code: "RIF", procedure: "Prórroga del Plan de Rotación", active: true, initially_required: true ).save
DocumentMaster.new(name: "Oficio de Solicitud", code: "D-OS", procedure: "Prórroga del Plan de Rotación", active: true , initially_required: true ).save
DocumentMaster.new(name: "Documentos probatorios", code: "D-PPP", procedure: "Prórroga del Plan de Rotación", active: true , initially_required: true ).save

#Licencias
DocumentMaster.new(name: "Cédula de Identidad", code: "CI", procedure: "Licencia", active: true , initially_required: true ).save
DocumentMaster.new(name: "RIF", code: "RIF", procedure: "Licencia", active: true, initially_required: true ).save
DocumentMaster.new(name: "Solicitud del Beneficiario", code: "D-SOL", procedure: "Licencia", active: true, initially_required: true ).save
DocumentMaster.new(name: "Justificación de la Licencia", code: "D-JL", procedure: "Licencia", active: true, initially_required: true ).save

#Prorroga de Licencia
DocumentMaster.new(name: "Cédula de Identidad", code: "CI", procedure: "Prórroga de Licencia", active: true , initially_required: true ).save
DocumentMaster.new(name: "RIF", code: "RIF", procedure: "Prórroga de Licencia", active: true, initially_required: true ).save
DocumentMaster.new(name: "Justificacón de la Pŕorroga", code: "D-JL", procedure: "Prórroga de Licencia", active: true, initially_required: true ).save
DocumentMaster.new(name: "Solicitud del beneficiario", code: "D-SB", procedure: "Prórroga de Licencia", active: true, initially_required: true ).save
DocumentMaster.new(name: "Documento probatorio", code: "D-DP", procedure: "Prórroga de Licencia", active: true, initially_required: true ).save
DocumentMaster.new(name: "Plan de trabajo o actividades", code: "D-PDT", procedure: "Prórroga de Licencia", active: true, initially_required: true ).save

#Reincorporacion luego de licencia
DocumentMaster.new(name: "Cédula de Identidad", code: "CI", procedure: "Reincorporación luego de Licencia", active: true , initially_required: true ).save
DocumentMaster.new(name: "RIF", code: "RIF", procedure: "Reincorporación luego de Licencia", active: true, initially_required: true ).save
DocumentMaster.new(name: "Oficio de Solicitud", code: "D-OS", procedure: "Reincorporación luego de Licencia", active: true , initially_required: true ).save


#Maestro de tipos de licencias
LicenseType.new(code: "1", name: "Enfermedad", description:"Licencia otorgada por enfermedad", active: true).save
LicenseType.new(code: "2", name: "Estudios", description:"Licencia otorgada para estudios", active: true).save
LicenseType.new(code: "3", name: "Misiones y comisiones de la Universidad", description:"Licencia otorgada para misiones y comisiones de la Universidad", active: true).save
LicenseType.new(code: "4", name: "Ejercer funciones en los Subsistemas de Educación", description:"Licencia otorgada para ejercer funciones en los Subsistemas de Educación", active: true).save
LicenseType.new(code: "5", name: "Ocupar cargos relevantes en la administración pública", description:"Licencia otorgada para ocupar cargos relevantes en la administración pública ", active: true).save
LicenseType.new(code: "6", name: "Cuaquier otro fin", description:"Licencia otorgada para cualquier otro fin", active: true).save

#Maestro de periodos de licencias
LicensePeriod.new(code: "1", name: "Hasta 15 días", description: "De 1 a 15 días", days: 15, months: 0, years: 0, active: true).save
LicensePeriod.new(code: "2", name: "Hasta 30 días", description: "De 1 a 30 días", days: 30, months: 0, years: 0, active: true).save
LicensePeriod.new(code: "3", name: "Hasta 90 días", description: "De 1 a 90 días", days: 90, months: 0, years: 0, active: true).save
LicensePeriod.new(code: "4", name: "Mayor a 90 días", description: "Mas de 90 días", days: 90, months: 0, years: 0, active: true).save




document = JointplanDocument.new(:name => 'Solicitud del Beneficiario', :typedoc =>1)
document.save!
document = JointplanDocument.new(:name => 'Fotocopia de la Cedula de identidad', :typedoc =>1)
document.save!
document = JointplanDocument.new(:name => 'Fotocopia del RIF',:typedoc =>1)
document.save!
document = JointplanDocument.new(:name => 'Fotocopia del ultimo ascenso', :typedoc =>1)
document.save!
document = JointplanDocument.new(:name => 'Plan de Trabajo', :typedoc =>1)
document.save!
document = JointplanDocument.new(:name => 'Justificacion de la escogencia del Plan', :typedoc =>1)
document.save!
document = JointplanDocument.new(:name => 'Razones de la escogencia del pais', :typedoc =>1)
document.save!
document = JointplanDocument.new(:name => 'Carta de aceptacion de cumplir con lo estipulado', :typedoc =>1)
document.save!
document = JointplanDocument.new(:name => 'Constancia de aceptacion por parte de la Universidad en la que desea realizar los estudios', :typedoc =>1)
document.save!
document = JointplanDocument.new(:name => 'Certificacion academica', :typedoc =>1)
document.save!
document = JointplanDocument.new(:name => 'Solvencias', :typedoc =>1)
document.save!
document = JointplanDocument.new(:name => 'Sintesis curricular', :typedoc =>1)
document.save!
document = JointplanDocument.new(:name => 'Constancia de manejo de idioma foraneo', :typedoc =>2)
document.save!
document = JointplanDocument.new(:name => 'Carta de Recomendacion de Aprobacion', :typedoc =>0)
document.save!
document = JointplanDocument.new(:name => 'Carta de desaprobacion' , :typedoc =>0)
document.save!
document = JointplanDocument.new(:name => 'Informe Parcial', :typedoc =>3)
document.save!
document = JointplanDocument.new(:name => 'Informe Final' , :typedoc =>1)
document.save!
document = JointplanDocument.new(:name => 'Carta de Aceptación', :typedoc =>0)
document.save!

JointPlan.new(:name => "Plan Conjunto",:user_id => 3,:status => 1).save!

JointPlan.new(:name => "Plan Conjunto",:user_id => 4,:status => 1).save!

JointPlan.new(:name => "Plan Conjunto",:user_id => 14,:status => 1).save!
TransferDocument.create!([
  {name: "Solicitud del Beneficiario", status: nil},
  {name: "Fotocopia de la Cedula de identidad", status: nil},
  {name: "Fotocopia del RIF", status: nil},
  {name: "Fotocopia del ultimo ascenso", status: nil},
  {name: "Plan de Trabajo", status: nil},
  {name: "Justificacion de la escogencia del Plan", status: nil},
  {name: "Razones de la escogencia del pais", status: nil},
  {name: "Carta de aceptacion de cumplir con lo estipulado", status: nil},
  {name: "Constancia de aceptacion por parte de la Universidad en la que desea realizar los estudios", status: nil},
  {name: "Certificacion academica", status: nil},
  {name: "Solvencias", status: nil},
  {name: "Sintesis curricular", status: nil},
  {name: "Constancia de manejo de idioma foraneo", status: nil},
  {name: "Carta de Recomendacion de Aprobacion", status: nil},
  {name: "Carta de desaprobacion", status: nil},
  {name: "Informe Parcial", status: nil},
  {name: "Informe Final", status: nil},
  {name: "Carta de Aceptación", status: nil},
  {name: "Copia Certificada Titulo Universitario", status: nil},
  {name: "Motivación Razonada para el Traslado", status: nil},
  {name: "Certificación Expedida de Secretario Universidad de Origen", status: nil},
  {name: "Copia de Oficio de Designación como Docente", status: nil},
  {name: "Copia de Oficio de Aprobación de Traslado", status: nil},
  {name: "Copia de Oficio de Aprobacion de Cambio en Dedicacion", status: nil},
  {name: "Oficio del Aval del Departamento", status: nil},
  {name: "Oficio de Consejo de Escuela", status: nil},
  {name: "Fondo Negro de Título IV Nivel", status: nil},
  {name: "Copia del Último Ascenso", status: nil},
  {name: "Copia de Curso de Certificación como Docente", status: nil}
])
FormalitiesMaster.create!([
  {name: "Traslados", description: "Se entiende por traslado al procedimiento académico administrativo mediante el cual un miembro del personal Docente y de Investigación puede ser transferido, en forma Parcial o Total, transitoria o permanentemente, a otra Unidad Académica de Adscripción en la misma Escuela, a otra Escuela o su equivalente o a otra Facultad, sin que implique un Cambio de Dedicación.", table_manager: "ProfessorsTransfer", isactive: true},
  {name: "Plan Conjunto", description: "Se entiende por Plan Conjunto a la combinación secuencial de un año sabático y una beca sueldo en la que el componente de Año Sabático queda incluido como parte del plan de formación al grado académico correspondiente y goza de todos los beneficios y soporta los deberes que se le otorgan al Becario.", table_manager: "JointPlan", isactive: false},
  {name: "Cambio de Dedicacion", description: "Se entiende por Cambio de Dedicación Temporal, al proceso mediante el cual, los miembros del personal Docente y de Investigación, por razones justificadas, a juicio del Consejo de Facultad, solicitan ante su Unidad Académica de adscripción ser clasificados en una dedicación distinta a la que poseen de manera Temporal, las cuales podrán ser solicitadas por", table_manager: "ProfessorsTransfer", isactive: true}
])

Reference.create!([
  {name: "region", description: nil},
  {name: "sub_region", description: nil},
  {name: "classification", description: nil},
  {name: "category", description: nil},
  {name: "type_employee", description: nil},
  {name: "type_of_translation", description: "Tipo de Traslado, puede ser Universitario, entre Escuelas o entre Facultades"},
  {name: "Universidades", description: "Traslado entre Universidades"},
  {name: "Facultades", description: ""},
  {name: "Escuela o Departamento", description: ""},
  {name: "Tipo de Cambio", description: "Tipo de cambio de dedicación ya sea Temporal, Permanente o solicitud de permanencia en la dedicación"},
  {name: "Dedicacion", description: "Tipo de dedicación del docente"}
])
ReferenceList.create!([
  {name: "without region", description: nil, value: nil, reference_id: 1},
  {name: "without sub region", description: nil, value: nil, reference_id: 2},
  {name: "asia", description: nil, value: nil, reference_id: 1},
  {name: "europe", description: nil, value: nil, reference_id: 1},
  {name: "africa", description: nil, value: nil, reference_id: 1},
  {name: "oceania", description: nil, value: nil, reference_id: 1},
  {name: "americas", description: nil, value: nil, reference_id: 1},
  {name: "southern asia", description: nil, value: nil, reference_id: 2},
  {name: "northern europe", description: nil, value: nil, reference_id: 2},
  {name: "southern europe", description: nil, value: nil, reference_id: 2},
  {name: "northern africa", description: nil, value: nil, reference_id: 2},
  {name: "polynesia", description: nil, value: nil, reference_id: 2},
  {name: "middle africa", description: nil, value: nil, reference_id: 2},
  {name: "caribbean", description: nil, value: nil, reference_id: 2},
  {name: "south america", description: nil, value: nil, reference_id: 2},
  {name: "western asia", description: nil, value: nil, reference_id: 2},
  {name: "australia and new zealand", description: nil, value: nil, reference_id: 2},
  {name: "western europe", description: nil, value: nil, reference_id: 2},
  {name: "eastern europe", description: nil, value: nil, reference_id: 2},
  {name: "central america", description: nil, value: nil, reference_id: 2},
  {name: "western africa", description: nil, value: nil, reference_id: 2},
  {name: "northern america", description: nil, value: nil, reference_id: 2},
  {name: "southern africa", description: nil, value: nil, reference_id: 2},
  {name: "eastern africa", description: nil, value: nil, reference_id: 2},
  {name: "south-eastern asia", description: nil, value: nil, reference_id: 2},
  {name: "eastern asia", description: nil, value: nil, reference_id: 2},
  {name: "melanesia", description: nil, value: nil, reference_id: 2},
  {name: "micronesia", description: nil, value: nil, reference_id: 2},
  {name: "central asia", description: nil, value: nil, reference_id: 2},
  {name: "instructor", description: nil, value: "1", reference_id: 3},
  {name: "asistente", description: nil, value: "2", reference_id: 3},
  {name: "agregado", description: nil, value: "3", reference_id: 3},
  {name: "asociado", description: nil, value: "4", reference_id: 3},
  {name: "titular", description: nil, value: "5", reference_id: 3},
  {name: "categoria I", description: nil, value: "1", reference_id: 4},
  {name: "categoria II", description: nil, value: "2", reference_id: 4},
  {name: "categoria III", description: nil, value: "3", reference_id: 4},
  {name: "categoria IV", description: nil, value: "4", reference_id: 4},
  {name: "categoria V", description: nil, value: "5", reference_id: 4},
  {name: "docente", description: nil, value: nil, reference_id: 5},
  {name: "de investigacion", description: nil, value: nil, reference_id: 5},
  {name: "aux docente", description: nil, value: nil, reference_id: 5},
  {name: "aux de investigacion", description: nil, value: nil, reference_id: 5},
  {name: "Universidad de Carabobo", description: "Universidad de Carabobo", value: "1", reference_id: 7},
  {name: "Universidad de Oriente (UDO)", description: "Universidad de Oriente (UDO)", value: "2", reference_id: 7},
  {name: "Universidad Jose Antonio Paez (UJAP)", description: "Universidad Jose Antonio Paez (UJAP)", value: "3", reference_id: 7},
  {name: "Traslado entre Universidades", description: "Traslado de Universidad a Universidad", value: "U", reference_id: 6},
  {name: "Traslado entre Facultades", description: "Traslados entre Facultades de la Universidad de Carabobo", value: "F", reference_id: 6},
  {name: "Traslado entre Escuelas", description: "Traslado entre Escuelas de la Universidad de Carabobo", value: "E", reference_id: 6},
  {name: "Cambio de Dedicación Permanente", description: "Cambio de Dedicación Permanente", value: "CDP", reference_id: 10},
  {name: "Cambio de Dedicación Temporal", description: "Cambio de Dedicación Temporal", value: "CDT", reference_id: 10},
  {name: "Permanencia en la Dedicación", description: "Permanencia en la Dedicación", value: "PED", reference_id: 10},
  {name: "Dedicacion Medio Tiempo", description: "", value: "DMT", reference_id: 11},
  {name: "Dedicacion Exclusiva o Tiempo Completo", description: "", value: "DE", reference_id: 11},
  {name: "Departamento de Computación", description: "Departamento de Computación de FACYT", value: "", reference_id: 9},
  {name: "Departamento de Biología", description: "Departamento de Biología de FACYT", value: "", reference_id: 9},
  {name: "Departamento de Quimica", description: "Departamento de Quimica de FACYT", value: "", reference_id: 9},
  {name: "Departamento de Física", description: "Departamento de Física de FACYT", value: "", reference_id: 9},
  {name: "Departamento de Matemática", description: "Departamento de Matemática de Facyt", value: "", reference_id: 9},
  {name: "Facultad de Ciencia y Tecnologia (FACYT)", description: "Facultad de Ciencia y Tecnologia (FACYT)", value: "FACYT", reference_id: 8},
  {name: "Facultad de Ciencias Económicas (FACES)", description: "Facultad de Ciencias Económicas (FACES)", value: "FACES", reference_id: 8},
  {name: "Facultad de Educación (FACE)", description: "Facultad de Educación", value: "FACE", reference_id: 8},
  {name: "Facultad de Ciencias Jurídicas Y Políticas (FCJP)", description: "Facultad de Ciencias Jurídicas Y Políticas (FCJP)", value: "FCJP", reference_id: 8},
  {name: "Facultad de Ciencia de la Salud (FCS)", description: "Facultad de Ciencia de la Salud (FCS)", value: "FCS", reference_id: 8},
  {name: "Facultad de Ingeniería (FACING)", description: "Facultad de Ingeniería (FACING)", value: "FACING", reference_id: 8},
  {name: "Facultad de Odontología ", description: "Facultad de Odontología ", value: "Facultad de Odontología ", reference_id: 8}
])
Employee.create!([
  {user_id: 4, type_employee_id: 2, scale_classification_id: 1, scale_category_id: 2, dedication_classification_id: nil, dedication_start_date: nil},
  {user_id: 3, type_employee_id: 40, scale_classification_id: 30, scale_category_id: 35, dedication_classification_id: nil, dedication_start_date: nil},
  {user_id: 8, type_employee_id: 40, scale_classification_id: 30, scale_category_id: 35, dedication_classification_id: 56, dedication_start_date: "2017-10-08"},
  {user_id: 15, type_employee_id: 40, scale_classification_id: 30, scale_category_id: 35, dedication_classification_id: 56, dedication_start_date: "2016-10-30"}
])
Faculty.create!([
  {name: "facultad de ciencias y tecnología", acronym: "FaCyT", active: true},
  {name: "facultad de ciencias de la salud", acronym: "FCS", active: true},
  {name: "facultad de ciencias económicas y sociales", acronym: "FaCES", active: true},
  {name: "facultad de ciencias juridicas y politicas", acronym: "FCJP", active: true},
  {name: "facultad de ingeniería", acronym: "FACING", active: true},
  {name: "facultad de odontología", acronym: "FAO", active: true},
  {name: "Facultad de ciencias de la educación", acronym: "FaCE", active: true}
])
#Seeds de Luis

employee = Employee.new(:user_id => 5,:type_employee_id => 2,:scale_classification_id => 1,:scale_category_id => 2)
employee.faculties << Faculty.find(1)
employee.save!

=begin
Employee::HABTM_Faculties.create!([
  {employee_id: 2, faculty_id: 1},
  {employee_id: 3, faculty_id: 1},
  {employee_id: 4, faculty_id: 1}
])
Faculty::HABTM_Employees.create!([
  {employee_id: 2, faculty_id: 1},
  {employee_id: 3, faculty_id: 1},
  {employee_id: 4, faculty_id: 1}
])
=end
FormalitiesDocument.create!([
  {formalities_master_id: 1, transfer_document_id: 19},
  {formalities_master_id: 1, transfer_document_id: 12},
  {formalities_master_id: 1, transfer_document_id: 22},
  {formalities_master_id: 1, transfer_document_id: 21},
  {formalities_master_id: 1, transfer_document_id: 4},
  {formalities_master_id: 1, transfer_document_id: 20},
  {formalities_master_id: 2, transfer_document_id: 1},
  {formalities_master_id: 2, transfer_document_id: 2},
  {formalities_master_id: 2, transfer_document_id: 3},
  {formalities_master_id: 2, transfer_document_id: 4},
  {formalities_master_id: 2, transfer_document_id: 5},
  {formalities_master_id: 2, transfer_document_id: 6},
  {formalities_master_id: 2, transfer_document_id: 7},
  {formalities_master_id: 2, transfer_document_id: 8},
  {formalities_master_id: 2, transfer_document_id: 9},
  {formalities_master_id: 2, transfer_document_id: 10},
  {formalities_master_id: 2, transfer_document_id: 11},
  {formalities_master_id: 2, transfer_document_id: 12},
  {formalities_master_id: 2, transfer_document_id: 9},
  {formalities_master_id: 2, transfer_document_id: 13},
  {formalities_master_id: 3, transfer_document_id: 2},
  {formalities_master_id: 3, transfer_document_id: 3},
  {formalities_master_id: 3, transfer_document_id: 22},
  {formalities_master_id: 3, transfer_document_id: 4},
  {formalities_master_id: 3, transfer_document_id: 25},
  {formalities_master_id: 3, transfer_document_id: 26},
  {formalities_master_id: 3, transfer_document_id: 27},
  {formalities_master_id: 3, transfer_document_id: 29}
])
process=FormalitiesMaster.where('id = ?',1).first
professortransfer = ProfessorsTransfer.new(:id => 132,
:name => "Traslados",
:status => "AP",
:user_id => 15,
:faculty_from_id => 62,
:faculty_to_id => 68,
:type_of_translate => 8,
:process_type => process)
professortransfer.save!

process=FormalitiesMaster.where('id = ?',1).first
professortransfer = ProfessorsTransfer.new(:id => 115,
:name => "Traslados",
:status => "IP",
:user_id => 8,
:faculty_from_id => 48,
:faculty_to_id => 47,
:type_of_translate => 7,
:process_type => process)
professortransfer.save!

process=FormalitiesMaster.where('id = ?',3).first
professortransfer = ProfessorsTransfer.new(:id => 133,
:name => "Cambio de Dedicacion",
:status => "IP",
:user_id => 15,
:faculty_from_id => 56,
:faculty_to_id => 53,
:type_of_translate => 51,
:process_type => process)
professortransfer.save!
=begin
ProfessorsTransfer.create!([
  {id: 132,name: "Traslados", status: "AP", user_id: 15, isactive: nil, processed: nil, isapproved: nil, faculty_from_id: 62, faculty_to_id: 68, type_of_translate: 8, process_type: 1},
  {id: 115,name: "Traslados", status: "IP", user_id: 8, isactive: nil, processed: nil, isapproved: nil, faculty_from_id: 48, faculty_to_id: 47, type_of_translate: 7, process_type: 1},
  {id: 133,name: "Cambio de Dedicacion", status: "IP", user_id: 15, isactive: nil, processed: nil, isapproved: nil, faculty_from_id: 56, faculty_to_id: 53, type_of_translate: 51, process_type: 3}
])
=end
process=ProfessorsTransfer.where('id = ?',115).first
attachment = TransferAttachment.new(:id => 209,
:user_id => 8,
:transfer_document_id => 23,
:file_file_name => "traslado_aprobacion_temp20171004-4608-1w1z7mm.pdf",
:file_content_type => "application/pdf",
:file_file_size => 104717, 
:file_updated_at =>"2017-10-05 02:35:33",
:process_id => process)
attachment.save!

process=ProfessorsTransfer.where('id = ?',132).first
attachment = TransferAttachment.new(:id => 227,
:user_id => 15,
:transfer_document_id => 23,
:file_file_name => "traslado_aprobacion_temp20171020-28749-1pe2jpu.pdf",
:file_content_type => "application/pdf",
:file_file_size => 104826, 
:file_updated_at =>"2017-10-20 06:28:14",
:process_id => process)
attachment.save!

TransferAttachment.create!([
  {id: 1,user_id: 2, transfer_document_id: 1, link: nil, file_file_name: "Wallpaper-3D-2013-.jpg", file_content_type: "image/jpeg", file_file_size: 532832, file_updated_at: "2017-02-12 22:54:14", process_id: nil},
  {id: 199,user_id: 8, transfer_document_id: 2, link: nil, file_file_name: "JesusDeAbreu.jpg", file_content_type: "image/jpeg", file_file_size: 33215, file_updated_at: "2017-09-27 03:49:39", process_id: nil},
  {id: 200,user_id: 8, transfer_document_id: 3, link: nil, file_file_name: "JesusDeAbreu2.jpg", file_content_type: "image/jpeg", file_file_size: 14756, file_updated_at: "2017-09-27 03:49:40", process_id: nil},
  {id: 151,user_id: 8, transfer_document_id: 4, link: nil, file_file_name: "3D-Wallpaper-5.jpg", file_content_type: "image/jpeg", file_file_size: 295162, file_updated_at: "2017-02-28 21:01:15", process_id: nil},
  {id: 155,user_id: 8, transfer_document_id: 12, link: nil, file_file_name: "certificadoRubyOnRails2.pdf", file_content_type: "application/pdf", file_file_size: 1153634, file_updated_at: "2017-02-28 23:33:18", process_id: nil},
  {id: 162,user_id: 8, transfer_document_id: 19, link: nil, file_file_name: "certificadoRubyOnRails3.pdf", file_content_type: "application/pdf", file_file_size: 1153634, file_updated_at: "2017-03-01 03:24:10", process_id: nil},
  {id: 154,user_id: 8, transfer_document_id: 20, link: nil, file_file_name: "3D-Wallpaper-52.jpg", file_content_type: "image/jpeg", file_file_size: 295162, file_updated_at: "2017-02-28 23:15:41", process_id: nil},
  {id: 163,user_id: 8, transfer_document_id: 6, link: nil, file_file_name: "3d-tv-14723_sqhNJej.jpg", file_content_type: "image/jpeg", file_file_size: 501358, file_updated_at: "2017-03-07 04:39:41", process_id: nil},
  {id: 149,user_id: 2, transfer_document_id: 19, link: nil, file_file_name: "certificadoRubyOnRails.pdf", file_content_type: "application/pdf", file_file_size: 1153634, file_updated_at: "2017-02-25 16:18:35", process_id: nil},
  {id: 183,user_id: 4, transfer_document_id: 4, link: nil, file_file_name: "3D-Cigarette-Wallpaper_VeqSC7f.jpg", file_content_type: "image/jpeg", file_file_size: 130334, file_updated_at: "2017-03-14 01:52:57", process_id: nil},
  {id: 184,user_id: 4, transfer_document_id: 12, link: nil, file_file_name: "3d-tv-14723_sqhNJej.jpg", file_content_type: "image/jpeg", file_file_size: 501358, file_updated_at: "2017-03-14 01:52:58", process_id: nil},
  {id: 150,user_id: 8, transfer_document_id: 21, link: nil, file_file_name: "download.jpg", file_content_type: "image/jpeg", file_file_size: 5086, file_updated_at: "2017-02-27 18:44:00", process_id: nil},
  {id: 185,user_id: 4, transfer_document_id: 19, link: nil, file_file_name: "3D-Wallpaper-5.jpg", file_content_type: "image/jpeg", file_file_size: 295162, file_updated_at: "2017-03-14 01:52:58", process_id: nil},
  {id: 186,user_id: 4, transfer_document_id: 20, link: nil, file_file_name: "certificadoRubyOnRails.pdf", file_content_type: "application/pdf", file_file_size: 1153634, file_updated_at: "2017-03-14 01:56:13", process_id: nil},
  {id: 187,user_id: 4, transfer_document_id: 21, link: nil, file_file_name: "3d-tv-14723_sqhNJej.jpg", file_content_type: "image/jpeg", file_file_size: 501358, file_updated_at: "2017-03-14 01:56:14", process_id: nil},
  {id: 188,user_id: 4, transfer_document_id: 22, link: nil, file_file_name: "download.jpg", file_content_type: "image/jpeg", file_file_size: 5086, file_updated_at: "2017-03-14 01:56:14", process_id: nil},
  {id: 189,user_id: 3, transfer_document_id: 12, link: nil, file_file_name: "3d-tv-14723_sqhNJej.jpg", file_content_type: "image/jpeg", file_file_size: 501358, file_updated_at: "2017-03-24 18:56:11", process_id: nil},
  {id: 190,user_id: 3, transfer_document_id: 19, link: nil, file_file_name: "certificadoRubyOnRails.pdf", file_content_type: "application/pdf", file_file_size: 1153634, file_updated_at: "2017-03-24 18:56:11", process_id: nil},
  {id: 191,user_id: 3, transfer_document_id: 20, link: nil, file_file_name: "3d-wallpaperfire-heart-3d-wallpaper---3d-hd-wallpaper-9hunqb6m_oOkydiq.jpg", file_content_type: "image/jpeg", file_file_size: 2097152, file_updated_at: "2017-03-24 18:56:11", process_id: nil},
  {id: 192,user_id: 3, transfer_document_id: 21, link: nil, file_file_name: "download.jpg", file_content_type: "image/jpeg", file_file_size: 5086, file_updated_at: "2017-03-24 18:56:11", process_id: nil},
  {id: 193,user_id: 3, transfer_document_id: 22, link: nil, file_file_name: "Wallpaper-3D-2013-.jpg", file_content_type: "image/jpeg", file_file_size: 532832, file_updated_at: "2017-03-24 18:56:12", process_id: nil},
  {id: 152,user_id: 3, transfer_document_id: 4, link: nil, file_file_name: "certificadoRubyOnRails.pdf", file_content_type: "application/pdf", file_file_size: 1153634, file_updated_at: "2017-02-27 21:53:57", process_id: nil},
  {id: 194,user_id: 2, transfer_document_id: 12, link: nil, file_file_name: "certificadoRubyOnRails.pdf", file_content_type: "application/pdf", file_file_size: 1153634, file_updated_at: "2017-03-24 19:06:31", process_id: nil},
  {id: 195,user_id: 2, transfer_document_id: 4, link: nil, file_file_name: "3D-Wallpaper-of-Tiger_60ipnX3.jpg", file_content_type: "image/jpeg", file_file_size: 389486, file_updated_at: "2017-03-24 19:08:26", process_id: nil},
  {id: 196,user_id: 2, transfer_document_id: 20, link: nil, file_file_name: "3d-tv-14723_sqhNJej.jpg", file_content_type: "image/jpeg", file_file_size: 501358, file_updated_at: "2017-03-24 19:08:26", process_id: nil},
  {id: 197,user_id: 2, transfer_document_id: 21, link: nil, file_file_name: "UCd.jpg", file_content_type: "image/jpeg", file_file_size: 120507, file_updated_at: "2017-03-24 19:08:26", process_id: nil},
  {id: 198,user_id: 2, transfer_document_id: 22, link: nil, file_file_name: "hexagons-3d-desktop-wallpaper-hd_VUiBHpV.jpg", file_content_type: "image/jpeg", file_file_size: 128475, file_updated_at: "2017-03-24 19:08:26", process_id: nil},
  {id: 153,user_id: 8, transfer_document_id: 22, link: nil, file_file_name: "pagocarne.pdf", file_content_type: "application/pdf", file_file_size: 63742, file_updated_at: "2017-09-03 23:12:40", process_id: nil},
  #{id: 209,user_id: 8, document_id: 23, link: nil, file_file_name: "traslado_aprobacion_temp20171004-4608-1w1z7mm.pdf", file_content_type: "application/pdf", file_file_size: 104717, file_updated_at: "2017-10-05 02:35:33", process_id: 115},
  {id: 214,user_id: 15, transfer_document_id: 12, link: nil, file_file_name: "3D-Cigarette-Wallpaper_VeqSC7f.jpg", file_content_type: "image/jpeg", file_file_size: 130334, file_updated_at: "2017-10-19 17:46:01", process_id: nil},
  {id: 215,user_id: 15, transfer_document_id: 20, link: nil, file_file_name: "3d-tv-14723_sqhNJej.jpg", file_content_type: "image/jpeg", file_file_size: 501358, file_updated_at: "2017-10-19 17:46:03", process_id: nil},
  {id: 216,user_id: 15, transfer_document_id: 19, link: nil, file_file_name: "3D-Wallpaper-of-Tiger_60ipnX3.jpg", file_content_type: "image/jpeg", file_file_size: 389486, file_updated_at: "2017-10-19 18:37:12", process_id: nil},
  {id: 224,user_id: 15, transfer_document_id: 21, link: nil, file_file_name: "controllers_complete_(1).png", file_content_type: "image/png", file_file_size: 121436, file_updated_at: "2017-10-19 19:58:26", process_id: nil},
  {id: 213,user_id: 15, transfer_document_id: 4, link: nil, file_file_name: "download.jpg", file_content_type: "image/jpeg", file_file_size: 5086, file_updated_at: "2017-10-20 01:34:19", process_id: nil},
  {id: 226,user_id: 15, transfer_document_id: 26, link: nil, file_file_name: "certificadoRubyOnRails.pdf", file_content_type: "application/pdf", file_file_size: 1153634, file_updated_at: "2017-10-20 02:05:27", process_id: nil},
  {id: 225,user_id: 15, transfer_document_id: 22, link: nil, file_file_name: "3D-Cigarette-Wallpaper_VeqSC7f.jpg", file_content_type: "image/jpeg", file_file_size: 130334, file_updated_at: "2017-10-20 02:36:44", process_id: nil},
  #{id: 227,user_id: 15, document_id: 23, link: nil, file_file_name: "traslado_aprobacion_temp20171020-28749-1pe2jpu.pdf", file_content_type: "application/pdf", file_file_size: 104826, file_updated_at: "2017-10-20 06:28:14", process_id: 132},
  {id: 229,user_id: 15, transfer_document_id: 3, link: nil, file_file_name: "controllers_complete.png", file_content_type: "image/png", file_file_size: 121436, file_updated_at: "2017-10-20 23:28:35", process_id: nil},
  {id: 230,user_id: 15, transfer_document_id: 25, link: nil, file_file_name: "female_user.png", file_content_type: "image/png", file_file_size: 1043, file_updated_at: "2017-10-20 23:28:36", process_id: nil},
  {id: 231,user_id: 15, transfer_document_id: 27, link: nil, file_file_name: "Etiqueta_Anaquel.pdf", file_content_type: "application/pdf", file_file_size: 12909, file_updated_at: "2017-10-20 23:28:36", process_id: nil},
  {id: 232,user_id: 15, transfer_document_id: 29, link: nil, file_file_name: "UCd.jpg", file_content_type: "image/jpeg", file_file_size: 120507, file_updated_at: "2017-10-20 23:28:36", process_id: nil},
  {id: 228,user_id: 15, transfer_document_id: 2, link: nil, file_file_name: "admin_1.png", file_content_type: "image/png", file_file_size: 57303, file_updated_at: "2017-10-20 23:41:23", process_id: nil}
])
RequestWorkflow.create!([
  {id: 24,name: "Workflow Traslado entre Universidades", description: "Flujo principal del trámite de Traslado entre Universidades", professors_transfer_id: 115, is_active: true, is_completed: false},
  {id: 29,name: "Workflow Traslado entre Facultades", description: "Flujo principal del trámite de Traslado entre Facultades", professors_transfer_id: 132, is_active: true, is_completed: false},
  {id: 36,name: "Workflow Cambio de Dedicación Temporal", description: "Flujo principal del trámite de Cambio de Dedicación Temporal", professors_transfer_id: 133, is_active: true, is_completed: false}
])
WorkflowStep.create!([
  {id: 157,name: "Analisis y Remisión de juicio de Asuntos Profesorales.", description: nil, request_workflow_id: 29, approval_date: "2017-10-20", role_id: 4, info: nil, step_number: 3, is_active: true, is_completed: nil, status: "AP"},
  {id: 126,name: "Analisis y Remisión de juicio a Decano.", description: nil, request_workflow_id: 24, approval_date: "2017-10-07", role_id: 6, info: nil, step_number: 3, is_active: true, is_completed: nil, status: "AP"},
  {id: 158,name: "Verificar Aval Academico y Presupuestario", description: nil, request_workflow_id: 29, approval_date: "2017-10-20", role_id: 5, info: nil, step_number: 4, is_active: true, is_completed: nil, status: "AP"},
  {id: 124,name: "Evaluación de Recaudos iniciales", description: nil, request_workflow_id: 24, approval_date: "2017-09-21", role_id: 5, info: nil, step_number: 1, is_active: true, is_completed: nil, status: "AP"},
  {id: 159,name: "Analisis y Remisión de juicio a Consejo de Facultad", description: nil, request_workflow_id: 29, approval_date: "2017-10-20", role_id: 5, info: nil, step_number: 5, is_active: true, is_completed: nil, status: "AP"},
  {id: 125,name: "Analisis y Remisión de juicio a Consejo de Departamento.", description: nil, request_workflow_id: 24, approval_date: "2017-09-24", role_id: 10, info: nil, step_number: 2, is_active: true, is_completed: nil, status: "AP"},
  {id: 192,name: "Aprobacion de Jefe de Departamento y Remisión de juicio a Decano.", description: nil, request_workflow_id: 36, approval_date: nil, role_id: 6, info: nil, step_number: 2, is_active: true, is_completed: nil, status: "DR"},
  {id: 193,name: "Verificar Aval Academico y Presupuestario", description: nil, request_workflow_id: 36, approval_date: nil, role_id: 4, info: nil, step_number: 3, is_active: true, is_completed: nil, status: "DR"},
  {id: 160,name: "Analisis Final de Traslado", description: nil, request_workflow_id: 29, approval_date: "2017-10-20", role_id: 7, info: nil, step_number: 6, is_active: true, is_completed: nil, status: "AP"},
  {id: 194,name: "Analisis y Remisión de juicio a Consejo de Facultad", description: nil, request_workflow_id: 36, approval_date: nil, role_id: 4, info: nil, step_number: 4, is_active: true, is_completed: nil, status: "DR"},
  {id: 195,name: "Analisis Final de Traslado", description: nil, request_workflow_id: 36, approval_date: nil, role_id: 7, info: nil, step_number: 5, is_active: true, is_completed: nil, status: "DR"},
  {id: 191,name: "Evaluación de Recaudos iniciales", description: nil, request_workflow_id: 36, approval_date: "2017-10-21", role_id: 5, info: nil, step_number: 1, is_active: true, is_completed: nil, status: "IP"},
  {id: 129,name: "Analisis y Remisión de juicio a Consejo de Facultad", description: nil, request_workflow_id: 24, approval_date: "2017-10-07", role_id: 5, info: nil, step_number: 6, is_active: true, is_completed: nil, status: "DR"},
  {id: 130,name: "Analisis Final de Traslado", description: nil, request_workflow_id: 24, approval_date: "2017-10-07", role_id: 7, info: nil, step_number: 7, is_active: true, is_completed: nil, status: "DR"},
  {id: 128,name: "Verificar Aval Academico y Presupuestario", description: nil, request_workflow_id: 24, approval_date: "2017-10-07", role_id: 5, info: nil, step_number: 5, is_active: true, is_completed: nil, status: "DR"},
  {id: 127,name: "Analisis y Remisión de juicio de Asuntos Profesorales.", description: nil, request_workflow_id: 24, approval_date: "2017-10-07", role_id: 4, info: nil, step_number: 4, is_active: true, is_completed: nil, status: "IP"},
  {id: 155,name: "Evaluación de Recaudos iniciales", description: nil, request_workflow_id: 29, approval_date: "2017-10-20", role_id: 5, info: nil, step_number: 1, is_active: true, is_completed: nil, status: "AP"},
  {id: 156,name: "Analisis y Remisión de juicio a Decano.", description: nil, request_workflow_id: 29, approval_date: "2017-10-20", role_id: 6, info: nil, step_number: 2, is_active: true, is_completed: nil, status: "AP"}
])
Review.create!([
  {name: "Analisis y Remisión de juicio a Consejo de Departamento.", comment: "igyggkjgj yg iyg iughklj hk ", files_reviewed: true, approval: true, workflow_step_id: 125, user_id: 24},
  {name: "Analisis y Remisión de juicio a Decano.", comment: "", files_reviewed: true, approval: true, workflow_step_id: 126, user_id: 20},
  {name: "Analisis y Remisión de juicio de Asuntos Profesorales.", comment: "", files_reviewed: true, approval: true, workflow_step_id: 127, user_id: 13},
  {name: "Verificar Aval Academico y Presupuestario", comment: "", files_reviewed: true, approval: true, workflow_step_id: 128, user_id: 14},
  {name: "Analisis y Remisión de juicio a Consejo de Facultad", comment: "Se aprueba", files_reviewed: true, approval: true, workflow_step_id: 129, user_id: 14},
  {name: "Analisis y Remisión de juicio a Decano.", comment: "Esta todo correcto, apruebo el Trámite", files_reviewed: true, approval: true, workflow_step_id: 156, user_id: 20},
  {name: "Analisis y Remisión de juicio de Asuntos Profesorales.", comment: "OK", files_reviewed: true, approval: true, workflow_step_id: 157, user_id: 13},
  {name: "Verificar Aval Academico y Presupuestario", comment: "ok", files_reviewed: true, approval: true, workflow_step_id: 158, user_id: 14},
  {name: "Analisis y Remisión de juicio a Consejo de Facultad", comment: "ok", files_reviewed: true, approval: true, workflow_step_id: 159, user_id: 14}
])
