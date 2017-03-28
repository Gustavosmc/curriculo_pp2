ActiveAdmin.register Candidato do
  menu false
  actions :all, except: [ :new, :create, :destroy, :edit, :update]
  
 controller do
   
  def scoped_collection
    super.where(vaga_id: params[:vaga])
  end
 
   
 end
 
 
 
 
 index do
   selectable_column
      id_column
      column :usuario do |c|
        c.usuario.nome
      end
      column :contratado
      column :observacao
      column :status
      
   actions defaults: true, method: :put do |candidato|
     if candidato.status == "AGUARDANDO"
       link_to 'Desclassificar', cancelar_admin_candidato_path(candidato),
            data: { confirm: 'Deseja desclassificar esse usuário?'}
     end
          
  end
  actions defaults: false, method: :put do |candidato|
    link_to 'Ver Curriculo', admin_curriculo_path(candidato.usuario.curriculo)
  end
  
 end
 
  # member_action :ver_curriculo, method: [:get, :put] do
  #   render "show"
  # end
 
  member_action :cancelar, method: [:get, :put] do
    respond_to do |format|
        @candidato = Candidato.find_by_id(params[:id])
        if Candidato.status[@candidato.status] == 0
          format.html { redirect_to admin_candidatos_url, notice: 'Candidato já está cancelado' }
        elsif Candidato.status[@candidato.status] == 2
          format.html { redirect_to admin_candidatos_url, notice: 'Candidato já está desclassificado' }
        else
          @candidato.status = 2
          if @candidato.save
            format.html { redirect_to admin_candidatos_url, notice: 'Candidato desclassificado' }
          end
        end
    end
  end
 
 filter :status, as: :select, collection: Candidato.status

end
