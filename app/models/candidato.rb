class Candidato < ApplicationRecord
  belongs_to :vaga
  belongs_to :usuario
  
  enum status: {CANCELADO: 0, AGUARDANDO: 1}
end
