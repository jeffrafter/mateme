class PatientProgram < ActiveRecord::Base
  set_table_name "patient_program"
  set_primary_key "patient_program_id"
  include Openmrs
  belongs_to :patient
  belongs_to :program

  named_scope :active, :conditions => ['patient_program.voided = 0 AND program.retired = 0'], :include => :program
  named_scope :current, :conditions => ['date_enrolled > ? AND (date_completed IS NULL OR date_completed > ?)', Time.now, Time.now]
end