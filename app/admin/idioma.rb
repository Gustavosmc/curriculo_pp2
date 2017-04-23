ActiveAdmin.register Idioma do
  menu label: "Idiomas"
  actions :all, except: [:destroy]
  permit_params :descricao, :status
  
  index :download_links => false  do
    column :descricao
    column :status
    column :created_at
    column :updated_at
    actions
  end

end
