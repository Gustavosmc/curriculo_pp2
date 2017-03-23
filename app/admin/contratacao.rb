ActiveAdmin.register Contratacao do
  actions :all, except: [:destroy, :create, :new, :update, :edit]
  
  index do
    id_column
    column "Usuário" do |contratacao|
      contratacao.usuario.nome << "(CPF: #{contratacao.usuario.cpf})"
    end
    column "Vaga" do |contratacao|
      contratacao.vaga.descricao
    end
    column "Setor" do |contratacao|
      contratacao.setor.descricao
    end
    
    actions
  end
     
  filter :setor, as: :select, collection: Setor.all.map{|s| ["#{s.descricao}", "#{s.descricao}", s.id]}


  # form do |f|
  #   f.inputs "Nova Contratação" do
  #     f.input :usuario, as: :select, collection: Usuario.all.map{|u| ["#{u.nome}", u.id]}
     
  #     f.actions
  #   end
  # end
  
  
end
