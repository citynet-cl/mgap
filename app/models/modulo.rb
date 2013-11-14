class Modulo < ActiveRecord::Base
	belongs_to :proyecto
	has_many :tareas
end
