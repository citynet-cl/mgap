class Responsable < ActiveRecord::Base
	belongs_to :cliente

	validates_presence_of :nombre
	validates_uniqueness_of  :nombre
	
	validates :fono, :numericality => { :greater_than => 1, :less_than => 9999999999 }
end
