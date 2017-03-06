class Usuario < ApplicationRecord
  

  has_one :curriculo
  has_many :candidatos
  has_many :vagas, through: :candidatos
  
  # Paperclip, upload arquivos
  has_attached_file :foto, styles: { medium: "236x316>", thumb: "118x158>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/
  
  validates_attachment :foto, content_type: { content_type: ["image/jpeg", "image/png"]}
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  enum sexo: {Feminino: 0, Masculino: 1}
  enum estadocivil: {Solteiro: 0, Casado: 1, Divorciado: 2, Viúvo: 3, Separado: 4, Companheiro: 5}
         
         
         
  after_initialize :default_values
  def default_values
    self.curriculo ||= Curriculo.create
  end
  
         
end
