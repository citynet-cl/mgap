class Cliente < ActiveRecord::Base
	before_save {|cliente| cliente.nombre = nombre.downcase.capitalize }
	before_save {|cliente| cliente.email = email.downcase }

	has_many :proyectos
	has_many :lugares
	has_many :modulos
	has_many :tareas
	has_many :responsables
	has_many :otros


	validates_uniqueness_of  :nombre, :email
	validates_presence_of :nombre, :email
	validates :email, :presence => true, :uniqueness => true, :email_format => true

	validates_format_of :rut, :with => /\A(\d{1,3})\.(\d{1,3})\.(\d{1,3})\-(k|\d{1})\Z/i, :message => "no válido."
	validates :fono, :numericality => { :greater_than => 1, :less_than => 9999999999 }
end
