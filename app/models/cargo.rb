class Cargo < ApplicationRecord
  belongs_to :curriculo
  
   enum desenvolvimento: {NÃO: 0, SIM: 1}
end
