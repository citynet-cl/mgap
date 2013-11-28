class Tarea < ActiveRecord::Base
	belongs_to :user
	belongs_to :proyecto
	belongs_to :modulo
	belongs_to :lugar
	belongs_to :cliente
	belongs_to :otro

	resourcify
	
	validates_presence_of :hh, :actividad
	validates :hh, :numericality => { :greater_than => 1, :less_than => 24 }

	def self.search(search)
		if search

			where('nombre LIKE ? OR user_id LIKE ?', "%#{search}%","%#{search}%")
		else
			scoped
		end
	end

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |product|
				csv << product.attributes.values_at(*column_names)
			end
		end
	end
end
