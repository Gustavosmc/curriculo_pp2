class Contratacao < ApplicationRecord
  belongs_to :usuario
  belongs_to :vaga
  belongs_to :setor
end
