class Proyecto < ActiveRecord::Base
	before_save { |proyecto| proyecto.nombre = nombre.downcase.capitalize }

	has_many :tareas, dependent: :destroy
	has_many :etapas
	has_many :users, through: :tareas

	belongs_to :cliente

	accepts_nested_attributes_for :etapas, :reject_if => :all_blank, allow_destroy: true

	validates_presence_of :nombre, :hh 
	validates :hh, :numericality => { :greater_than_or_equal_to => 1 }

end
