class Lugar < ActiveRecord::Base
	has_many :responsables
	belongs_to :cliente
end
