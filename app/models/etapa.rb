class Etapa < ActiveRecord::Base
	before_save { |etapa| etapa.nombre = nombre.downcase.capitalize }
	
	belongs_to :proyecto
	has_many :tareas

	def hhi
		self.tareas.sum(:hh)		
	end
end
