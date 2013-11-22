class Etapa < ActiveRecord::Base
  belongs_to :proyecto
  belongs_to :modulo
end
