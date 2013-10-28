class User < ActiveRecord::Base
	has_many :tareas
	has_many :proyectos, through: :tareas

	has_secure_password

	validates_uniqueness_of :email

	validates :password, length: {in: 5..20}
end
