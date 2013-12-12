class User < ActiveRecord::Base
	before_save {|user| user.usuario = usuario.downcase }
	before_save {|user| user.email = email.downcase }

	has_many :tareas, dependent: :destroy
	has_many :proyectos, through: :tareas

	rolify

	has_secure_password

	validates_uniqueness_of  :usuario, :email
	validates_presence_of :usuario, :email
	validates :email, :presence => true, :uniqueness => true, :email_format => true

	#validates :password, :presence => false 

	validates :password, length: {in: 5..20}, allow_blank: true
	validates_confirmation_of :password
end

