class Responsable < ActiveRecord::Base
	belongs_to :lugar
	has_and_belongs_to_many :tareas
end
