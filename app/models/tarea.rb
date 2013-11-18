class Tarea < ActiveRecord::Base
	belongs_to :user
	belongs_to :proyecto
	belongs_to :modulo

	resourcify
	
	validates_presence_of :hh, :actividad
	validates :hh, :numericality => { :greater_than => 1, :less_than => 24 }


end
