class Tarea < ActiveRecord::Base
	belongs_to :user
	belongs_to :proyecto
	belongs_to :lugar
	belongs_to :cliente

	resourcify
	
	validates_presence_of :nombre, :hh, :actividad, :cliente, :proyecto
	validates :hh, :numericality => { :greater_than => 0, :less_than => 100 }

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |product|
				csv << product.attributes.values_at(*column_names)
			end
		end
	end
end
