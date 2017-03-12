class Setor < ApplicationRecord
    validates :descricao, presence: true, length: { maximum: 80 }
end
