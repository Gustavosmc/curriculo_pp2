class Contratacao < ApplicationRecord
  validates :vaga, uniqueness: true
  belongs_to :usuario
  belongs_to :vaga
  belongs_to :setor
end
