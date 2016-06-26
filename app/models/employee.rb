class Employee < ActiveRecord::Base
  belongs_to :user, inverse_of: :employee

  belongs_to :type_employee, :class_name => 'ReferenceList'
  belongs_to :scale_category, :class_name => 'ReferenceList'
  belongs_to :scale_clasification, :class_name => 'ReferenceList'

  has_and_belongs_to_many :faculties
end
