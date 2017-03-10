class Cargo < ApplicationRecord
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
