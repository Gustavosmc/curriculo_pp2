class Curriculo < ApplicationRecord
  has_one :usuario

  validates :observacao, presence: true 
end
