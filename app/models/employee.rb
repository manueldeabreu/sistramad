class Employee < ApplicationRecord
  belongs_to :user, inverse_of: :employee

  belongs_to :type_employee, :class_name => 'ReferenceList'
  belongs_to :scale_category, :class_name => 'ReferenceList'
  belongs_to :scale_classification, :class_name => 'ReferenceList'
  belongs_to :dedication_classification, :class_name => 'ReferenceList'
  belongs_to :faculty_classification, :class_name => 'ReferenceList'
  belongs_to :department_classification, :class_name => 'ReferenceList'

  has_and_belongs_to_many :faculties
end
