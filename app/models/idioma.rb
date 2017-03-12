class Idioma < ApplicationRecord
    validates :descricao, presence: true, length: { maximum: 80 }
    
    has_many :idioma_curriculos
    has_many :curriculos, through: :idioma_curriculos
    
    enum status: {INATIVO: 0, ATIVO: 1}
    
   

end
