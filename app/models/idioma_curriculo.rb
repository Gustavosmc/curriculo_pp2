class IdiomaCurriculo < ApplicationRecord
  belongs_to :curriculo
  belongs_to :idioma
  
  
   enum le: {Ruim: 0, Regular: 1, Bom: 2, Ótimo: 3}, _prefix: :leitura
   enum escreve: {Ruim: 0, Regular: 1, Bom: 2, Ótimo: 3}, _prefix: :escrita
   enum fala: {Ruim: 0, Regular: 1, Bom: 2, Ótimo: 3}, _prefix: :pronuncia
end
