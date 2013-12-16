class Tarea < ActiveRecord::Base
	belongs_to :user
	belongs_to :proyecto
	belongs_to :lugar
	belongs_to :cliente
	belongs_to :etapa

	acts_as_paranoid 
	resourcify
	
	validates_presence_of :hh, :actividad, :cliente, :proyecto
	validates :hh, :numericality => { :greater_than => 0, :less_than => 100 }

end
