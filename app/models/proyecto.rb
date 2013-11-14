class Proyecto < ActiveRecord::Base
	before_save { |proyecto| proyecto.nombre = nombre.downcase.capitalize }

	has_many :tareas, dependent: :destroy
	has_many :users, through: :tareas
	has_many :modulos

	belongs_to :cliente

	validates_presence_of :nombre, :hh 
	validates :hh, :numericality => { :greater_than_or_equal_to => 1 }

end
