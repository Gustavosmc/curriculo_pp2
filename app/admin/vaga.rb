ActiveAdmin.register Vaga do
  permit_params :descricao, :especial, :requisitos, :status, :setor_id, :salario
  actions :all, except: [:destroy]
  
  controller do
    
    
    
  end

  
  index  :download_links => false do
      selectable_column
      id_column
      column :descricao
      column "Setor" do |s|
         s.setor.descricao
       end
      column :especial
      column :status
      column :salario do |s|
        number_to_currency s.salario
      end
      
      actions defaults: true, method: :put do |vaga|
        link_to 'Cancelar', cancelar_admin_vaga_path(vaga),
          data: {confirm: 'Atenção! Isso cancelará a vaga permanentemente. Deseja realmente cancelar?'}
      end
      
      actions defaults: false, method: :get do |vaga|
        link_to "Ver #{Candidato.where("vaga_id = #{vaga.id} AND status = 1").count} Candidatos", admin_candidatos_path(vaga: vaga.id)
      end
   end
   
    filter :status, as: :select, collection: Vaga.status
    filter :especial, as: :select, collection: Vaga.especiais
    filter :descricao
    filter :created_at
      
  form do |f|
    f.inputs "Gerenciar Vagas" do
      f.input :setor_id, as: :select,
        collection: Setor.where(status: 1).map{|s| [s.descricao, s.id]}
      f.input :descricao
      f.input :especial, as: :select,
        :collection => Vaga.especiais.map{|u| [u[0], u[0]]} 
      f.input :requisitos 
      f.input :salario 
      f.actions
    end
  end
  
  
    
  member_action :cancelar, method: [:get, :put] do
    respond_to do |format|
        if Vaga.status[resource.status] == 0
          format.html { redirect_to admin_vagas_url, notice: 'Vaga já está cancelada' }
        elsif Vaga.status[resource.status] == 2
          format.html { redirect_to admin_vagas_url, notice: 'Vaga já está ocupada' }
        else
          resource.status = 0
          if resource.save
            format.html { redirect_to admin_vagas_url, notice: 'Vaga cancelada com sucesso' }
          end
        end
    end
  end
  
 

end
