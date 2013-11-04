class Tarea < ActiveRecord::Base
	belongs_to :user
	belongs_to :proyecto
	resourcify
	
	validates_presence_of :hh, :actividad


	searchable do
		text :nombre, :actividad
	end
end
