class Usuario < ApplicationRecord
  attr_accessor :cpf, :telefone

  
  validates :nome, presence: true, length: { minimum: 3, maximum: 160 }
  validates :telefone, presence: true, length: { maximum: 15 }
  validates :cpf, presence: true, length: { maximum: 15 } , uniqueness: true
  validates_cpf :cpf
  validates :naturalidade, presence: true
  validates :endereco, presence: true, length: { maximum: 160 }
  

  has_one :curriculo
  has_many :candidatos
  has_many :vagas, through: :candidatos
  
  # Paperclip, upload arquivos
  has_attached_file :foto, styles: { medium: "236x316>", thumb: "118x158>" },  :default_url => "/images/default_image.png"
  validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/
  
  validates_attachment :foto, content_type: { content_type: ["image/jpeg", "image/png"]}
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  enum sexo: {Feminino: 0, Masculino: 1}
  enum estadocivil: {Solteiro: 0, Casado: 1, Divorciado: 2, Viúvo: 3, Separado: 4, Companheiro: 5}
         
  
  after_initialize :criar_curriculo

  def criar_curriculo
    self.curriculo ||= Curriculo.new if self.new_record?
  end

  
  def telefone=(val)
    val = val.gsub("-", '').gsub("(", '').gsub(")", '').gsub(" ", '').gsub("_", '')
    write_attribute(:telefone, val)
  end
  
  def telefone
    read_attribute(:telefone)
  end
  
  
  def cpf=(val)
    val = val.gsub("-", '').gsub(".", '')
    write_attribute(:cpf, val)
  end
  
  def cpf
    read_attribute(:cpf)
  end
  
  
         
end
