class TipoTarea < ActiveRecord::Base
	has_many :tareas
	resourcify
end
