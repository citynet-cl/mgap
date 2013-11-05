class Proyecto < ActiveRecord::Base
	has_many :tareas
	has_many :users, through: :tareas

	belongs_to :cliente

	validates_presence_of :nombre, :hh 
	validates :hh, :numericality => { :greater_than_or_equal_to => 1 }

end
