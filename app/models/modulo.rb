class Modulo < ActiveRecord::Base
	belongs_to :cliente
	has_many :tareas

	validates_presence_of :nombre
end
