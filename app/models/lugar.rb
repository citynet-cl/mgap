class Lugar < ActiveRecord::Base
	before_save {|lugar| lugar.nombre = nombre.downcase.capitalize }
	before_save {|lugar| lugar.ciudad = ciudad.downcase.capitalize }
	before_save {|lugar| lugar.planta = planta.downcase.capitalize }

	resourcify
	has_many :tareas
	belongs_to :cliente
end
