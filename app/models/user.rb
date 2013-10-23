class User < ActiveRecord::Base
	has_secure_password

	validates_uniqueness_of :email

	validates :password, length: {in: 5..20}
end
