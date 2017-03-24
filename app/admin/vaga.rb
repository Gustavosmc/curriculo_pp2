ActiveAdmin.register Vaga do
    permit_params :descricao, :especial, :requisitos, :status
    actions :all, except: [:destroy]
  
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
      actions defaults: true, method: :put do |vaga|
        link_to 'Cancelar', cancelar_admin_vaga_path(vaga)
      end
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

    
  member_action :cancelar, method: [:get, :put] do
      resource.status = 0
      respond_to do |format|
      if resource.save
        format.html { redirect_to admin_vagas_url, notice: 'Vaga cancelado com sucesso' }
      end
    end
  end
 

end
