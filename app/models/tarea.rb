class Tarea < ActiveRecord::Base
	belongs_to :user
	belongs_to :proyecto
	belongs_to :modulo
	belongs_to :lugar
	has_and_belongs_to_many :responsables

	resourcify
	
	validates_presence_of :hh, :actividad
	validates :hh, :numericality => { :greater_than => 1, :less_than => 24 }


end
