ActiveAdmin.register Curriculo do
  menu label: "Currículos"
  actions :all, except: [:update, :edit, :destroy, :create, :new]
  
  controller do
    
    def show
      @usuario = Usuario.find_by_id(params[:id])
      @curriculo = @usuario.curriculo
      @foto = @usuario.foto.url(:medium)
      @mes =@usuario.nascimento.month 
      @naturalidade = @usuario.naturalidade.to_s
      @estadocivil = @usuario.estadocivil ? @usuario.estadocivil : ""
     
      super do |format|
        format.pdf do
           render pdf: "curriculo",
              template: "curriculos/show.pdf.erb",
              encoding: 'utf8'
        end
      end
      
    end
  end
  
  show title: proc{|curriculo| "Curriculo de " << curriculo.usuario.nome } do 
      render "show"
  end

 
  
  index :download_links => false  do
    selectable_column
    id_column
    column "Usuário" do |curriculo|
      curriculo.usuario.nome
    end
    column "Email" do |curriculo|
      curriculo.usuario.email
    end
    column "Telefone" do |curriculo|
      curriculo.usuario.telefone
    end
    column "Criado em" do |curriculo|
      curriculo.created_at
    end
    
    
    actions
    
  end
 
 
  filter :usuario_nome, as: :string, label: "Nome"
  filter :parente_associado
  filter :parentesco, as: :select, collection: Curriculo.parentescos
  filter :usuario_sexo, as: :select, collection: Usuario.sexos, label: "Sexo"
  filter :idioma_curriculos, as: :select, collection: Idioma.where(status: 1).map{|i| ["#{i.descricao}", i.id]}
  filter :titulos_descricao, as: :string, label: "Títulos(formação superior, cursos, etc)"
  filter :titulos_grau, as: :select, collection: Titulo.graus, label: "Grau de Estudo"
  filter :cargos_descricao, as: :string, label: "Experiência Profissional"
  filter :cargo_pretendidos_descricao, as: :string, label: "Cargo Pretendido"
  filter :created_at
  
end
