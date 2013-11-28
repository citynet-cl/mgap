class Otro < ActiveRecord::Base
	belongs_to :cliente
	has_many :tareas
end
