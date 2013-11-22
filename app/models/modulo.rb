class Modulo < ActiveRecord::Base
	belongs_to :cliente
	has_many :tareas
	has_many :etapas

	validates_presence_of :nombre
end
