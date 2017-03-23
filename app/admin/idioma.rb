ActiveAdmin.register Idioma do
  actions :all, except: [:destroy]
  permit_params :descricao, :status
  

end
