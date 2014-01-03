class TipoTarea < ActiveRecord::Base
	has_many :tareas
	resourcify
	validates_presence_of :nombre
	validates_uniqueness_of :nombre
end
