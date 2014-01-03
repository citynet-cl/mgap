class Proyecto < ActiveRecord::Base
	before_save { |proyecto| proyecto.nombre = nombre.downcase.capitalize }
	acts_as_paranoid 

	has_many :tareas, dependent: :destroy
	has_many :etapas
	has_many :users, through: :tareas

	belongs_to :cliente

	resourcify

	accepts_nested_attributes_for :etapas, :reject_if => :all_blank, allow_destroy: true

	validates_presence_of :nombre, :hh, :cliente 
	validates :hh, :numericality => { :greater_than_or_equal_to => 1 }

	def hhi
		self.tareas.sum(:hh)		
	end

	def cerrado?
		self.estado		
	end
end
