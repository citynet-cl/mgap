class Lugar < ActiveRecord::Base
	has_many :responsables
	has_many :tareas
	belongs_to :cliente
end
