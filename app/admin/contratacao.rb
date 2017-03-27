ActiveAdmin.register Contratacao do
  menu label: "Contratações"
  actions :all, except: [:destroy, :create, :new, :update, :edit]
  
  index do
    id_column
    column "Usuário" do |contratacao|
      contratacao.usuario.nome 
    end
    column "Vaga" do |contratacao|
      contratacao.vaga.descricao
    end
    column "Setor" do |contratacao|
      contratacao.setor.descricao
    end
    column "Contratado em" do |contratacao|
      contratacao.created_at
    end
    
    actions
  end
     
  filter :setor, as: :select, collection: Setor.all.map{|s| ["#{s.descricao}", "#{s.descricao}", s.id]}
  filter :usuario_nome, as: :string
  filter :usuario_sexo, as: :select, collection: Usuario.sexos
  filter :vaga_especial, as: :select, collection: Vaga.especiais
  filter :created_at


  # form do |f|
  #   f.inputs "Nova Contratação" do
  #     f.input :usuario, as: :select, collection: Usuario.all.map{|u| ["#{u.nome}", u.id]}
     
  #     f.actions
  #   end
  # end
  
  
end
