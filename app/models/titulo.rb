class Titulo < ApplicationRecord
  belongs_to :curriculo
  
  enum desenvolvimento: {FINALIZADO: 0, CURSANDO: 1, TRANCADO: 2}
  
  enum grau: {Técnico: 0, Tecnólogo: 1, Bacharelado: 2, Licenciatura: 3, Especialização: 4, Mestrado: 5, Doutorado: 6}
  
  enum modalidade: {PRESENCIAL: 0, EAD: 1}

end
