class Candidato < ApplicationRecord
  belongs_to :vaga
  belongs_to :usuario
end
