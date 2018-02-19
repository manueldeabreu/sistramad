class ReferenceList < ApplicationRecord
  belongs_to :reference, inverse_of: :reference_lists

  has_many   :countries_region, :class_name => 'Country', :foreign_key => 'region_id'
  has_many   :countries_sub_region, :class_name => 'Country', :foreign_key => 'sub_region_id'
  has_many   :employees_type, :class_name => 'Employee', :foreign_key => 'type_employee_id'
  has_many   :employees_category, :class_name => 'Employee', :foreign_key => 'scale_category_id'
  has_many   :employees_classification, :class_name => 'Employee', :foreign_key => 'scale_classification_id'
  has_many   :employees_dedication, :class_name => 'Employee', :foreign_key => 'dedication_classification_id'
  has_many   :employees_faculty, :class_name => 'Employee', :foreign_key => 'faculty_classification_id'
  has_many   :employees_department, :class_name => 'Employee', :foreign_key => 'department_classification_id'

  #scope :type_employee, -> { where(:reference_id => ReferenceConstant::TYPE_EMPLOYEE) }
  #scope :scale_classification, -> { where(:reference_id => ReferenceConstant::SCALE_CLASSIFICATION) }
  #scope :scale_category, -> { where(:reference_id => ReferenceConstant::SCALE_CATEGORY) }
  #scope :dedication_classification, -> { where(:reference_id => ReferenceConstant::DEDICATION_CLASSIFICATION) }
  #scope :faculty_classification, -> { where(:reference_id => ReferenceConstant::FACULTY_CLASSIFICATION) }
  #scope :department_classification, -> { where(:reference_id => ReferenceConstant::DEPARTMENT_CLASSIFICATION) }
  scope :type_employee, -> { where(:reference_id => 5) }
  scope :scale_classification, -> { where(:reference_id => 3) }
  scope :scale_category, -> { where(:reference_id => 4) }
  scope :dedication_classification, -> { where(:reference_id => 11) }
  scope :faculty_classification, -> { where(:reference_id => 8) }
  scope :department_classification, -> { where(:reference_id => 9) }
end
