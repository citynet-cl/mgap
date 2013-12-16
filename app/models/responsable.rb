class Responsable < ActiveRecord::Base
	before_save {|responsable| responsable.nombre = nombre.downcase.capitalize }
	belongs_to :cliente
	resourcify

	validates_presence_of :nombre
	validates_uniqueness_of  :nombre
	
	validates :fono, :numericality => { :greater_than => 1, :less_than => 9999999999 }
end
