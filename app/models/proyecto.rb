class Proyecto < ActiveRecord::Base
	has_many :tareas
	has_many :users, through: :tareas

	belongs_to :cliente
end
