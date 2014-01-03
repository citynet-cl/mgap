class Responsable < ActiveRecord::Base
	before_save {|responsable| responsable.nombre = nombre.downcase.capitalize }
	belongs_to :cliente
	resourcify

	validates_presence_of :nombre
	validates_uniqueness_of  :nombre
	validates :email, :email_format => true, allow_blank: true
	
	validates :fono, :numericality => { :greater_than => 0, :less_than => 9999999999 }, allow_blank: true
end
