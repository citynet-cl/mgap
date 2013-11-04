class Tarea < ActiveRecord::Base
	belongs_to :user
	belongs_to :proyecto
	resourcify
	
	validates_presence_of :hh, :actividad


end
