ActiveAdmin.register Setor do
  actions :all, except: [:destroy]
  permit_params :descricao, :status

  index :download_links => false do
    column :descricao
    column :status
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs "Gerenciar Setores" do
      f.input :descricao
      f.input :status, as: :select, 
        :collection => Setor.status.map{|u| [u[0], u[0]]}, selected: "Ativo"
      f.actions
    end
  end

end
