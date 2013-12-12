class Cliente < ActiveRecord::Base
	before_save {|cliente| cliente.nombre = nombre.downcase.capitalize }
	before_save {|cliente| cliente.email = email.downcase }

	has_many :proyectos, dependent: :destroy
	has_many :lugares, dependent: :destroy
	has_many :tareas, dependent: :destroy
	has_many :responsables, dependent: :destroy

	validates_uniqueness_of  :nombre, :email, :rut
	validates_presence_of :nombre
	validates :email, :email_format => true

	validates_format_of :rut, :with => /\A(\d{1,3})\.(\d{1,3})\.(\d{1,3})\-(k|\d{1})\Z/i, :message => "no válido."
	#validates :fono, :numericality => { :greater_than => 1, :less_than => 9999999999 }
end
