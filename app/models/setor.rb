class Setor < ApplicationRecord
    validates :descricao, presence: true, length: { maximum: 80 }
    
    enum status: {Inativo: 0, Ativo: 1}
end
