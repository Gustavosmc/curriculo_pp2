ActiveAdmin.register Vaga do
    actions :all, except: [:destroy]
    permit_params :descricao, :especial, :requisitos, :status
    
    index do
        selectable_column
        id_column
        column :descricao
        column :especial
        column :requisitos
        column :status
        column :salario do |s|
          number_to_currency s.salario
        end
        
        
        actions
     end
     
      filter :status, as: :select, collection: Vaga.status
      filter :especial, as: :select, collection: Vaga.especiais
      filter :descricao
      filter :created_at
      
    form do |f|
      f.inputs "Gerenciar Vagas" do
        f.input :descricao
        f.input :especial, as: :select,
          :collection => Vaga.especiais.map{|u| [u[0], u[0]]} 
        f.input :requisitos 
        f.input :salario 
        f.input :status, as: :select, 
          :collection => Vaga.status.map{|u| [u[0], u[0]]}
        f.actions
      end
    end

    
 

end
