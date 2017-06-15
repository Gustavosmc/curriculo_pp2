class Cargo < ApplicationRecord
  validates :descricao, presence: true, length: { maximum: 80 }
  validates :desenvolvimento, presence: true
  validates :entidade, presence: true, length: { maximum: 80 }
  validates :inicio, presence: true

  attr_accessor :ultimo_sal
  
  belongs_to :curriculo
  
  enum desenvolvimento: {NÃO: 0, SIM: 1}
   
   
  def ultimo_sal=(val)
    val = val.gsub("R$", '')
    write_attribute(:ultimo_sal, val)
  end
  
  def ultimo_sal
    read_attribute(:ultimo_sal)
  end
   
end
