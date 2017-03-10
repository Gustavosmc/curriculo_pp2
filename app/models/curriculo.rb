class Curriculo < ApplicationRecord
  

  has_one :usuario
  
  has_many :cargos
  has_many :cargo_pretendidos
  has_many :titulos
  
  has_many :idioma_curriculos
  has_many :idiomas, through: :idioma_curriculos
  
  accepts_nested_attributes_for :cargos, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :titulos, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :idioma_curriculos, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :cargo_pretendidos, reject_if: :all_blank, allow_destroy: true
  
  
  

 
end
