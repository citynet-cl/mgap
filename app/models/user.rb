class User < ActiveRecord::Base
  rolify
	has_many :tareas
	has_many :proyectos, through: :tareas

	has_secure_password

	validates_uniqueness_of :email, :usuario

	#validates :password, :presence => false 

	validates :password, length: {in: 5..20}, allow_blank: true
	validates_confirmation_of :password
end
