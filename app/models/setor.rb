class Setor < ApplicationRecord
    has_many :vagas
    validates :descricao, presence: true, length: { maximum: 80 }
    
    enum status: {Inativo: 0, Ativo: 1}
end
