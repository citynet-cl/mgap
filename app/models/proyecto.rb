class Proyecto < ActiveRecord::Base
	has_many :tareas
	has_many :users, through: :tareas
end
