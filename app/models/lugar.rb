class Lugar < ActiveRecord::Base
  belongs_to :cliente
  has_many :responsables
end