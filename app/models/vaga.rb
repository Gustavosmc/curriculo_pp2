class Vaga < ApplicationRecord
  validates :descricao, presence: true, length: { maximum: 80 }
  
  # ActiveRecord relacionamentos
  belongs_to :setor
  
  has_many :candidatos
  has_many :usuarios, through: :candidatos
  
  # Enums
  enum especial: { SIM: 1, NAO: 0}
  enum status: {CANCELADA: 0, ABERTA: 1, FECHADA: 2}
  
  
  
  def self.search(search)
    if search
      where('descricao LIKE ? and status = ?', "%#{search}%", 1)
    else
      where('status = ?', 1)
    end
  end
  
  
  
end
