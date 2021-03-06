class CargoPretendido < ApplicationRecord
  validates :descricao, presence: true,  length: { maximum: 80 }
  
  
  attr_accessor :pretensao_sal
  belongs_to :curriculo
  
  
  
  def pretensao_sal=(val)
    val = val.gsub("R$", '')
    write_attribute(:pretensao_sal, val)
  end
  
  def pretensao_sal
    read_attribute(:pretensao_sal)
  end
end
