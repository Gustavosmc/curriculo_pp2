ActiveAdmin.register AdminUser do
  menu label: "Administradores"
  permit_params :email, :password, :password_confirmation
  actions :all, except: [:destroy]
  
  

  index :download_links => false  do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :created_at

  form do |f|
    f.inputs "Gerenciar Administradores" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
