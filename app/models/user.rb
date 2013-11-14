class User < ActiveRecord::Base
	has_many :tareas
	has_many :proyectos, through: :tareas

	rolify

	has_secure_password

	validates_uniqueness_of  :usuario, :email
	validates_presence_of :usuario, :email
	validates :email, :presence => true, :uniqueness => true, :email_format => true

	#validates :password, :presence => false 

	validates :password, length: {in: 5..20}, allow_blank: true
	validates_confirmation_of :password

  	before_save :downcase_fields

    	def downcase_fields
		self.usuario.downcase
	end


end

