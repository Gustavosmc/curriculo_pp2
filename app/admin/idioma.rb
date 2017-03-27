ActiveAdmin.register Idioma do
  menu label: "Idiomas"
  actions :all, except: [:destroy]
  permit_params :descricao, :status
  

end
